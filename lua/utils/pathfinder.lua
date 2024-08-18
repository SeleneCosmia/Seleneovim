local pathfinder
local stringify
local fs, fn = vim.fs, vim.fn

local home = os.getenv('HOME')

function pathfinder:get_config_root()
  local config = fn.stdpath('config')
  if not config then
    return home .. '/.config/nvim'
  end
  return config
end

function pathfinder:get_data_path()
  local data = fn.stdpath('data')
  if not data then
    return home .. '/.local/share/nvim'
  end
  return data
end

--[[
---@param from fun(resolved_dir)
---@param mod any
function pathfinder:load_modules(from, mod)
  local mod_root = self:get_config_root()
  local resolved_dir = 
  from()
end ]]

return pathfinder
