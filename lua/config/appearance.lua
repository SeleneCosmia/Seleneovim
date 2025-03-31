---@diagnostic disable:unused-local
local Config = {}

-- ╓──────────────────────╖
-- ║ Smooth Cursor Config ║
-- ╙──────────────────────╜
Config.smooth_cursor = function()
  local smooth = require 'smoothcursor'
  local config = {
    type = 'exp',
    linehl = 'CursorLine',
    fancy = {
      enable = true,
      head = { cursor = '❥ ', texthl = 'SmoothCursor', linehl = 'CursorLine' },
      body = {
        { cursor = '', texthl = '@ibl.scope.char.1'  },
        { cursor = '🟏', texthl = '@ibl.indent.char.6' },
        { cursor = '', texthl = '@ibl.indent.char.5' },
        { cursor = '☿', texthl = '@ibl.indent.char.4' },
        { cursor = '⚸', texthl = '@ibl.indent.char.3' },
        { cursor = '✴', texthl = '@ibl.indent.char.2' },
        { cursor = '', texthl = '@ibl.indent.char.1' },
      },
      tail = { cursor = nil, texthl = 'SmoothCursor' }
    },
    disable_float_win = true,
    disabled_filetypes = {
      'qf',
      'lazy',
      'man',
      'mason',
      'noice',
      'help',
      'neo-tree',
      'TelescopeResults',
      'TelescopePrompt',
    }
  }
  return smooth.setup(config)
end

-- ╓────────────────────────╖
-- ║ Icon Auto-Color Config ║
-- ╙────────────────────────╜
Config.icon_colors = function()
  local devicons = require 'tiny-devicons-auto-colors'
  local opts = {
    autoreload = true,
    cache = {
      enabled = true,
      path = vim.fn.stdpath('cache') .. '/devicon-auto-colors-cache.json',
    },
    precise_search = {
      enabled = true,
      iteration = 10,
      precision = 22,
      threshold = 24,
    }
  }
  return devicons.setup(opts)
end

return Config
