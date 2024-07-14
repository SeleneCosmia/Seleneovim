local pathfinder = {}
-- https://github.com/vsedov/nvim/blob/fec3b27ac95e353720e4fdd01c315ff3edbd1ea6/lua/core/helper.lua

local home = os.getenv('HOME')

function pathfinder:get_config_path()
    local config = os.getenv('XDG_CONFIG_DIR')
    if not config then
        return home .. '/.config/nvim'
    end
    return config
end

function pathfinder:get_data_path()
    local data = os.getenv('XDG_DATA_DIR')
    if not data then
        return home .. '/.local/share/nvim'
    end
    return data
end

return pathfinder
