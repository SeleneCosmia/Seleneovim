local uv, api, fn, fs = vim.uv, vim.api, vim.fn, vim.fs
local helper = require "core.helper"

local Pack = {}

function Pack:load_luarocks_packages()
    local rocks_dir = helper.get_rocks_path()

    local get_luarocks_list = function()
        local rock = {}
        local luarocks_modules = fs.dir(rocks_dir,
        {

        })
    end
end

return Pack
