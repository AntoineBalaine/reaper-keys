local log = require("utils.log")
local serpent = require("serpent")

local project_state = {}

---@param ext string
---@param key string
---@param lua_table table	| string
function project_state.overwrite(ext, key, lua_table)
	local current_project, _ = reaper.EnumProjects(-1)
	local lua_table_string = serpent.block(lua_table, { comment = false })
	reaper.SetProjExtState(current_project, ext, key, lua_table_string)
end

---@param ext string
function project_state.getAll(ext)
	local keys = {}
	local max_keys = 5000
	local exists = false
	for i = 0, max_keys do
		ok, key, val = reaper.EnumProjExtState(0, ext, i)
		if not ok then
			break
		end

		ok, lua_table = serpent.load(val)
		if not ok then
			return false, keys
		end

		keys[key] = lua_table
		exists = true
	end

	return exists, keys
end

---@param ext string
---@param key string
function project_state.get(ext, key)
	local current_project, _ = reaper.EnumProjects(-1)
	local exists, value = reaper.GetProjExtState(current_project, ext, key)
	if exists and value then
		local ok, lua_table = serpent.load(value)
		if not ok or not lua_table then
			return false, lua_table
		end

		if lua_table["deleted"] then
			return false, lua_table
		end

		return ok, lua_table
	end

	return false, "Does not exist"
end

---@param ext string
---@param key string
function project_state.delete(ext, key)
	-- reaper has the function 'DeleteExtState', but it dosen't work for project
	-- state, so I introduce a 'deleted' key to indicate deletion
	local ok, val = project_state.get(ext, key)
	if ok and not val["deleted"] then
		val["deleted"] = true
		project_state.overwrite(ext, key, val)
	end
end

return project_state
