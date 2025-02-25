local utils = require("command.utils")
local config = require("definitions.config")

local definitions = {}

---@param t1 table
---@param t2 table
local function concatEntries(t1, t2)
	local merged_entries = {}
	for key_sequence, entry_value in pairs(t1) do
		merged_entries[key_sequence] = entry_value
	end

	for key_sequence, t2_value in pairs(t2) do
		local merged_value = t2_value
		if t2_value == "" then
			merged_value = nil
		end

		local t1_value = merged_entries[key_sequence]
		if utils.isFolder(t2_value) and utils.isFolder(t1_value) and t1_value[1] == t2_value[1] then
			local folder_1_entries = t1_value[2]
			local folder_2_entries = t2_value[2]
			merged_value = {
				t2_value[1],
				concatEntries(folder_1_entries, folder_2_entries),
			}
		end

		merged_entries[key_sequence] = merged_value
	end

	return merged_entries
end

---@param t1 table
---@param t2 table
local function concatEntryTables(t1, t2)
	local merged_tables = t1
	for action_type, entries in pairs(t1) do
		if t2[action_type] then
			local merged = concatEntries(t1[action_type], t2[action_type])
			merged_tables[action_type] = merged
		end
	end

	for action_type, entries in pairs(t2) do
		if not merged_tables[action_type] then
			merged_tables[action_type] = entries
		end
	end

	return merged_tables
end

local default_tables_dir = "definitions.defaults."
if config.use_extended_defaults then
	default_tables_dir = "definitions.extended_defaults."
end
local user_definitions = require("definitions.bindings")
local definition_tables = {
	global = concatEntryTables(require(default_tables_dir .. "global"), user_definitions.global),
	main = concatEntryTables(require(default_tables_dir .. "main"), user_definitions.main),
	midi = concatEntryTables(require(default_tables_dir .. "midi"), user_definitions.midi),
}

---get all possible keybindings for a given context (includes global and "midi" or "main")
---@param context "main" | "midi" | "global"
---@return Definition[]
function definitions.getPossibleEntries(context)
	local merged_table = {}
	merged_table = concatEntryTables(merged_table, definition_tables["global"])
	merged_table = concatEntryTables(merged_table, definition_tables[context])

	return merged_table
end

-- this reverses the keys and values of entries
function definitions.getBindings(entries)
	local bindings = {}
	if not entries then
		return bindings
	end

	for entry_key, entry_value in pairs(entries) do
		if utils.isFolder(entry_value) then
			local folder_table = entry_value[2]
			local folder_bindings = definitions.getBindings(folder_table)

			for action_name_from_folder, binding_from_folder in pairs(folder_bindings) do
				bindings[action_name_from_folder] = entry_key .. binding_from_folder
			end
		else
			bindings[entry_value] = entry_key
		end
	end

	return bindings
end

function definitions.getAllBindings()
	local bindings = {}

	for context, context_definitions in pairs(definition_tables) do
		bindings[context] = {}

		for action_type, action_type_definitions in pairs(context_definitions) do
			bindings[context][action_type] = definitions.getBindings(action_type_definitions)
		end
	end

	local user_bindings = {}
	for context, context_definitions in pairs(user_definitions) do
		user_bindings[context] = {}

		for action_type, action_type_definitions in pairs(context_definitions) do
			local bindings_for_action_type = definitions.getBindings(action_type_definitions)

			if not bindings[context][action_type] then
				bindings[context][action_type] = {}
			end
			for k, v in pairs(bindings_for_action_type) do
				bindings[context][action_type][k] = v
			end
		end
	end

	return bindings
end

function definitions.getAllEntries()
	return definition_tables
end

return definitions
