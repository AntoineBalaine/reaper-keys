dofile("/home/antoine/Documents/Experiments/lua/debug_connect.lua")
-- @noindex
local utils = require("custom_actions.utils")
local serpent = require("serpent")
local REALERN_PARAMS = 100
ENCODERS_PER_ROW = 4
local Color_list = {
  "02", --navy
  "0F", --skyBlue
  "19", --turquoise
  "2E", --oliveGreen
  "3C", --appleGreen
  "40", --yellow
  "49", --orange
  "56", --red
  "5A", --pink
  "6B", --purple
  "71", --violet
}
local Color_enum = {
  navy = "02",
  skyBlue = "0F",
  turquoise = "19",
  oliveGreen = "2E",
  appleGreen = "3C",
  yellow = "40",
  orange = "49",
  red = "56",
  pink = "5A",
  purple = "6B",
  violet = "71",
}

---Create a «do nothing» mapping, containing a unique ID and the base glue and target sections.
---@return Mapping
local function createIdleMapping()
  local id = utils.uuid()
  return {
    id = id,
    name = id,
    target = {
      kind = "Track",
      track = {
        address = "This",
        track_must_be_selected = true,
      },
      action = "DoNothing",
    }
  }
end

---create a bank for the given bnk_idx
---@param bnk_idx number
local function createBank(bnk_idx)
  ---@type Bank
  local bank = {
    id = utils.uuid(),
    name = "BANK" .. bnk_idx,
    activation_condition = {
      kind = "Bank",
      parameter = 0,
      bank_index = bnk_idx - 1,
    },
  }
  return bank
end

---create dummy mappings in current bank for all available encoder slots
---@param bnk_id string
---@param bnk_idx integer
---@param dummies_start_idx integer
---@param ENCODERS_COUNT integer
local function create_dummies(bnk_id, bnk_idx, dummies_start_idx, ENCODERS_COUNT)
  local dummies = {} ---@type Mapping[]
  -- create dummy mappings for the rest of the encoders
  for i = dummies_start_idx, ENCODERS_COUNT do
    local idle_mapping = createIdleMapping()
    idle_mapping.name = "_"
    idle_mapping.group = bnk_id
    idle_mapping.activation_condition = {
      kind = "Bank",
      parameter = 0,
      bank_index = bnk_idx,
    }
    idle_mapping.on_activate = {
      send_midi_feedback = {
        {
          kind = "Raw",
          ---assign black to dummy params
          message = "B1 " ..
              utils.toHex(i - 1) .. " " .. "00"
        },
      },
    }
    table.insert(dummies, idle_mapping)
  end
  return dummies
end
---@param ENCODERS_COUNT integer
local function LOC(ENCODERS_COUNT)
  local L = {
    data = {}
  }
  L.pageIdx = -1
  ---@type integer[]
  L.availableParams = (function()
    local avail = {}
    for i = 1, REALERN_PARAMS - 1 do ---starts at one since 0 is the bank param
      table.insert(avail, i)
    end
    return avail
  end)()
  L.colorIdx = 0

  ---@return integer|nil
  function L:new_param()
    local param_idx = table.remove(self.availableParams, 1)
    return param_idx
  end

  function L:increment_color()
    self.colorIdx = (self.colorIdx + 1) % #Color_list
    if self.colorIdx == 0 then self.colorIdx = 1 end
    return Color_list[self.colorIdx]
  end

  function L:init()
    self:new_page()
    return self
  end

  function L:cur_maps_in_page()
    local count = 0
    for i, map in pairs(self.data[self.pageIdx].maps) do
      if map.target.kind ~= "Dummy" then
        count = count + 1
      end
    end
    return count
  end

  function L:fill_left_over_space_in_last_bank_with_dummies()
    local last_bank = self.data[self.pageIdx].bnk
    local last_bank_idx = #self.data[self.pageIdx].maps
    local dummies_start_idx = last_bank_idx + 1
    local dummies = create_dummies(last_bank.id, self.pageIdx, dummies_start_idx, ENCODERS_COUNT)
    for _, dummy in ipairs(dummies) do
      table.insert(self.data[self.pageIdx].maps, dummy)
    end
  end

  function L:add_dummies_page()
    self:new_page()
    local dummies = create_dummies(self.data[self.pageIdx].bnk.id, self.pageIdx, 1, ENCODERS_COUNT)
    for _, dummy in ipairs(dummies) do
      table.insert(self.data[self.pageIdx].maps, dummy)
    end
  end

  ---@param fx FxDescr
  function L:insert_fx(fx)
    local fx_colour = self:increment_color()
    for i, param in pairs(fx.params) do
      if param.mapping == nil then goto continue end ---if fx has no mapping, continue
      -- REPLACE THE DUMMIES, DON'T JUST ADD TO THEM
      self:insert(param.mapping, fx_colour)
      ::continue::
    end
  end

  ---@param mod_name string
  ---@param encoder_idx integer -- 0-indexed
  ---@param target_interval number[]
  function L:create_cycleBtn(mod_name, encoder_idx, target_interval, realearn_param_idx)
    local cycle_btn = createIdleMapping()
    cycle_btn.feedback_enabled = false
    cycle_btn.name = mod_name .. "_cycl"
    local page_idx = ((self.pageIdx / 100) - 0.001)
    if page_idx < 0 then page_idx = 0 end
    cycle_btn.activation_condition = {
      kind = "Bank",
      parameter = 0, -- paging is all on param 0
      bank_index = self.pageIdx,
    }
    cycle_btn.source = {
      kind = "Virtual",
      id = encoder_idx,
      character = "Button",
    }
    cycle_btn.glue = {
      absolute_mode = "IncrementalButton",
      target_interval = target_interval,
      wrap = true,
      step_size_interval = { 0.01, 0.05 },
    }
    cycle_btn.target = {
      kind = "FxParameterValue",
      parameter = {
        address = "ById",
        index = realearn_param_idx,
      },
      poll_for_feedback = false,
    }
    return cycle_btn
  end

  function L:format_low_hi(val)
    local low = (val / 100) - 0.001
    if low < 0 then low = 0 end
    local hi = (val / 100) + 0.009
    return low, hi
  end

  function L:format_modifier_idx(val)
    return "p[" .. val .. "]" -- modifier index
  end

  function L:format_expression_condition(bnk, modifier)
    local mod_low, mod_hi = L:format_low_hi(modifier)
    local b_idx = L:format_modifier_idx(bnk) -- which bank/page we're in, synth page is 0
    return b_idx .. " >= " .. mod_low .. " && " .. b_idx .. " < " .. mod_hi
  end

  ---@class Param_n_modifier
  ---@field bnk integer
  ---@field modifier integer

  --- `p[0] > 0.009 && p[0] < 0.019 && p[1] > 0.009 && p[1] < 0.019`
  ---
  --- The way that's written looks awkward,
  --- but realearn can't read `p[0]==0.001` as `true`: floating point numbers are inaccurate…
  ---@param prm_n_modifier Param_n_modifier[]
  function L:format_condition(prm_n_modifier)
    local expressions = {}
    for i, v in ipairs(prm_n_modifier) do
      table.insert(expressions, L:format_expression_condition(v.bnk, v.modifier))
    end
    return table.concat(expressions, " && ")
  end

  ---@param encoder_idx integer
  ---@param color string
  function L:format_color(encoder_idx, color)
    return "B1 " .. utils.toHex(encoder_idx) .. " " .. color
  end

  ---comment
  ---@param title string
  ---@param opt string
  ---@param encoder_idx integer
  ---@param alt_color string
  ---@param prm_n_modifier Param_n_modifier[]
  function L:create_col(title, opt, encoder_idx, alt_color, prm_n_modifier)
    local param = createIdleMapping()
    param.name = title .. "_" .. opt
    param.source = {
      kind = "Virtual",
      id = encoder_idx,
    }
    param.on_activate = {
      send_midi_feedback = {
        {
          kind = "Raw",
          message = L:format_color(encoder_idx, alt_color)
        },
      },
    }
    local conditions_list = { { bnk = 0, modifier = self.pageIdx } }
    for i, condition in ipairs(prm_n_modifier) do
      table.insert(conditions_list, { bnk = condition.bnk, modifier = condition.modifier - 1 })
    end
    param.activation_condition = {
      kind = "Expression",
      condition = L:format_condition(conditions_list)
    }
    table.insert(self.data[self.pageIdx].maps, param)
  end

  ---@param dest "filt1_cut" | "amp" | "pitch" | "filt2_cut"
  function L:lfo_dest_color(dest)
    local opts = {
      filt1_cut = Color_enum.red,
      amp = Color_enum.yellow,
      pitch = Color_enum.turquoise,
      filt2_cut = Color_enum.purple,
    }
    return opts[dest]
  end

  function L:create_synth_map()
    local synth_layout = {
      {
        title = "OSC",
        alts = { "osc1", "osc2", "sub", "noise" },
        opts = { "oct", "fine", "wave", "volume" },
        colors = {
          Color_enum.navy, Color_enum.yellow, Color_enum.oliveGreen, Color_enum.turquoise },
        noise = {
          opts = { "white", "pink" },
          colors = {
            Color_enum.turquoise, Color_enum.pink }
        }
      },
      {
        title = "ENV",
        alts = { "FILT_ENV", "AMP_ENV", "PITCH_ENV" },
        opts = { "A", "D", "S", "R" },
        colors = {
          Color_enum.red, Color_enum.yellow, Color_enum.turquoise }
      },
      {
        title = "FILT",
        alts = { "filt1", "filt2_hp" },
        opts = { "cut", "res", "steep", "type" },
        colors = {
          Color_enum.red, Color_enum.purple }
      },
      {
        title = "LFO",
        alts = { "lfo1", "lfo2" },
        opts = { "rate", "amt", "wave", "nothg_yet" },
        colors = { Color_enum.skyBlue, Color_enum.navy },
        amt = {
          colors = {
            Color_enum.red, Color_enum.yellow, Color_enum.turquoise, Color_enum.purple },
          opts = { "filt1_cut", "amp", "pitch", "filt2_cut" }
        }
      }
    }
    for row_idx, row in ipairs(synth_layout) do
      ---Create a bank that matches the current alt. This is done by assigning one of realearn's params
      local row_param = L:new_param() or -1
      local cycle_btn = L:create_cycleBtn(row.title, (row_idx - 1) * ENCODERS_PER_ROW, { 0, (#row.alts - 1) / 100 },
        row_param)

      table.insert(self.data[self.pageIdx].maps, cycle_btn)
      for alt_idx, alt in ipairs(row.alts) do
        local alt_color = row.colors[alt_idx]
        for col_idx, opt in ipairs(row.opts) do
          local encoder_idx = (row_idx - 1) * ENCODERS_PER_ROW + (col_idx - 1)
          if row.title == "LFO" and opt == "amt" then
            ---amt knob gets a modifier button that cycles through the 4 options

            local destination_param = L:new_param() or -1
            local destination_cycle_btn = L:create_cycleBtn("dest", encoder_idx, { 0, (#row.amt.opts - 1) / 100 },
              destination_param)
            table.insert(self.data[self.pageIdx].maps, destination_cycle_btn)
            -- create a alts for each destination
            for amt_opt_idx, amt_opt in ipairs(row.amt.opts) do
              local conditions_list = {
                { bnk = row_param,         modifier = alt_idx },
                { bnk = destination_param, modifier = amt_opt_idx }
              }
              L:create_col(alt, "amt_" .. amt_opt, encoder_idx, L:lfo_dest_color(amt_opt),
                conditions_list)
            end
          else
            L:create_col(alt, opt, encoder_idx, alt_color, { { bnk = row_param, modifier = alt_idx } })
          end
        end
      end
    end
  end

  function L:find_available_idx()
    return #self.data[self.pageIdx].maps + 1
  end

  ---@param map Mapping
  ---@param fx_colour string | nil
  function L:insert(map, fx_colour)
    if fx_colour == nil then fx_colour = "00" end
    -- if current bank is full, create a new one
    -- else, add to current bank
    if self:cur_maps_in_page() >= ENCODERS_COUNT then
      self:new_page()
    end
    local encoder_id = self:find_available_idx()
    -- TODO IS THIS THE PROBLEM

    map.group = self.data[self.pageIdx].bnk.id
    map.activation_condition.bank_index = self.pageIdx
    map.source.id = encoder_id - 1 -- does this need to be zero-indexed
    -- map.source = { kind = "Virtual", id = encoder_id }
    map.on_activate = {
      send_midi_feedback = { {
        kind = "Raw",
        message = "B1 " ..
            utils.toHex((encoder_id - 1) % ENCODERS_COUNT) ..
            " " .. fx_colour ---assign LED colours to buttons here
      } }
    }
    -- insert into maps
    -- replace dummy mapping with new mapping
    table.insert(self.data[self.pageIdx].maps, map)
  end

  function L:new_page()
    self.pageIdx = self.pageIdx + 1
    local bnk = createBank(self.pageIdx)
    bnk.activation_condition.bank_index = self.pageIdx
    self.data[self.pageIdx] = {
      maps = {},
      bnk = bnk,
    }
  end

  function L:get_maps()
    -- reduce to get all banks
    local maps = {}
    for _, datum in pairs(self.data) do
      for _, map in pairs(datum.maps) do
        table.insert(maps, map)
      end
    end
    return maps
  end

  function L:get_bnks()
    -- reduce to get all banks
    local bnks = {}
    for _, bnk in pairs(self.data) do
      table.insert(bnks, bnk.bnk)
    end
    return bnks
  end

  return L:init()
end

local Main_compartment_mapper = {}
---@param ENCODERS_COUNT integer number of encoders on the current controller
function Main_compartment_mapper.Map_selected_fx_in_visible_chain(ENCODERS_COUNT)
  ---@return Bank[] bnks
  ---@return Mapping[] fx
  local function build()
    local bnks = LOC(ENCODERS_COUNT)
    bnks:create_synth_map()
    bnks:fill_left_over_space_in_last_bank_with_dummies()
    bnks:add_dummies_page()
    return bnks:get_bnks(), bnks:get_maps()
  end

  local bnks, maps = build()

  ---All controller mappings here.
  ---Bank selectors and bank mappings all go together.
  local main_compartment = {
    kind = "MainCompartment",
    version = "2.15.0",
    value = {
      groups = bnks,
      mappings = utils.TableConcat(
      -- pagers,
        maps
      ),
    },
  }


  return main_compartment
end

local MFT2 = {}

function MFT2.create_fx_map()
  local ENCODERS_COUNT = 16
  local main_compartment = Main_compartment_mapper.Map_selected_fx_in_visible_chain(ENCODERS_COUNT)

  -- local MFT_MAPPING = { MFT_controller_compartment, main_compartment }

  local lua_table_string = serpent.serialize(main_compartment, { comment = false }) -- stringify the modulator
  reaper.CF_SetClipboard(lua_table_string)
end

return MFT2
