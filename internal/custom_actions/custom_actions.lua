local log = require("utils.log")
local format = require("utils.format")

local custom_actions = {
	move = require("custom_actions.movement"),
	items = require("custom_actions.items"),
	select = require("custom_actions.selection"),
	midi = require("custom_actions.midi"),
	midi_arranging = require("custom_actions.midi_arranging"),
	midi_controller = require("custom_actions.midi_controller"),
	drums = require("custom_actions.drums"),
	tracks = require("custom_actions.tracks"),
	envelope = require("custom_actions.envelope"),
	routing = require("custom_actions.routing"),
	dev = require("custom_actions.dev"),
	kawa = require("custom_actions.kawa"),
	harmonizer = require("custom_actions.harmonizer"),
	pasteRhythm = require("custom_actions.pasteRhythm"),
	MFT = require("custom_actions.MFT"),
	fx = require("custom_actions.fx"),
}

function custom_actions.clearTimeSelection()
	local current_position = reaper.GetCursorPosition()
	reaper.GetSet_LoopTimeRange(true, false, current_position, current_position, false)
end

local function getUserGridDivisionInput()
	local _, num_string = reaper.GetUserInputs("Set Grid Division", 1, "Fraction/Number", "")
	local first_num = num_string:match("[0-9.]+")
	local divider = num_string:match("/([0-9.]+)")

	local division = nil
	if first_num and divider then
		division = first_num / divider
	elseif first_num then
		division = first_num
	else
		log.error("Could not parse specified grid division.")
		return nil
	end

	return division
end

function custom_actions.setMidiGridDivision()
	local division = getUserGridDivisionInput()
	if division then
		reaper.SetMIDIEditorGrid(0, division)
		reaper.Main_OnCommand(reaper.NamedCommandLookup("_SN_FOCUS_MIDI_EDITOR"), 0)
	end
end

function custom_actions.clearSelectedTimeline()
	local current_position = reaper.GetCursorPosition()
	reaper.GetSet_LoopTimeRange(true, false, current_position, current_position, false)
end

function custom_actions.setGridDivision()
	local division = getUserGridDivisionInput()
	if division then
		reaper.SetProjectGrid(0, division)
	end
end

-- this one avoids splitting all items across tracks in time selection, if no items are selected
function custom_actions.splitItemsAtTimeSelection()
	if reaper.CountSelectedMediaItems(0) == 0 then
		return
	end
	local SplitAtTimeSelection = 40061
	reaper.Main_OnCommand(SplitAtTimeSelection, 0)
end

return custom_actions
