---@diagnostic disable:unused-local
local Config = {}

local api, fn = vim.api, vim.fn
-- ╓──────────────────────╖
-- ║ Smooth Cursor Config ║
-- ╙──────────────────────╜
Config.smooth_cursor = function()
  api.nvim_create_augroup('smooth-cursor-autocmd', { clear = false })

  local smooth = require 'smoothcursor'
  local config = {
    type = 'exp',
    linehl = 'CursorLine',
    fancy = {
      enable = true,
      head = { cursor = '❥', texthl = 'SmoothCursor', linehl = 'CursorLine' },
      body = {
        { cursor = '', texthl = '@ibl.scope.char.1'  },
        { cursor = '🟏', texthl = '@ibl.indent.char.6' },
        { cursor = '', texthl = '@ibl.indent.char.5' },
        { cursor = '☿', texthl = '@ibl.indent.char.4' },
        { cursor = '⚸', texthl = '@ibl.indent.char.3' },
        { cursor = '', texthl = '@ibl.indent.char.2' },
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
      'snacks_dashboard',
      'snacks_notify',
      'snacks_picker_input',
      'TelescopeResults',
      'TelescopePrompt',
    }
  }

  api.nvim_create_autocmd('ModeChanged', {
    desc = 'Change SmoothCursor sign on mode-change',
    group = 'smooth-cursor-autocmd',
    callback = function()
      local cursor = {
        n = { char = '❥', color = '#9E9B2C' },
        i = { char = '❥', color = '#F75EB4' },
        v = { char = '󰆐', color = '#BEDDEA' },
        V = { char = '', color = '#BEDDEA' },
        [''] = { char = '󰹈', color = '#58BFC9' },
        R = { char = '󰴓', color = '#B190EB' }
      }
      local c = cursor[fn.mode()] or cursor.n
      api.nvim_set_hl(0, 'SmoothCursor', { fg = c.color })
      fn.sign_define('smoothcursor', { text = c.char })
    end,
  })

  return smooth.setup(config)
end

return Config
