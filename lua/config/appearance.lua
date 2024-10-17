---@diagnostic disable:unused-local
local Config = {}
local load = require

Config.indent = function()
  -- stylua: ignore start
  local ibl, hooks, hl =
    load 'ibl',
    load 'ibl.hooks',
    load 'utils.globals'.hl
  -- stylua: ignore end
end

Config.statuscolumn = function()
  local StCl = require 'statuscol'
  local builtin = require 'statuscol.builtin'

  local config = {
    setopt = true,
    relculright = false,
    ft_ignore = {
      'TelescopePrompt',
      'TelescopeResults',
      'mason',
      'lazy',
      'neo-tree',
      'noice',
      'help',
      'checkhealth',
      'lsp_markdown'
    },
    bt_ignore = { 'help', 'terminal', 'nofile' },
    segments = {
      { -- (1) fold indicators
        text = { builtin.foldfunc },
        condition = { true },
        click = 'v:lua.ScFa'
      }, { -- (2) Smooth Cursor
        sign = {
          name = {'.*'},
          namespace = { '.*' },
          maxwidth = 2,
          colwidth = 2,
        },
        condition = { true },
        -- click = 'v:lua.ScSa'
      }, { -- (3) diagnostic signs, only shown if diagnostic signs exist in buffer
        sign = {
          namespace = { 'diagnostic/signs' },
          maxwidth = 2,
          colwidth = 1,
          auto = true
        },
        click = 'v:luaScSa',
      }, { -- (4) line numbers
        text = { builtin.lnumfunc },
        click = 'v:lua.ScLa'
      },
      { text = { '┆' }, condition = { builtin.not_empty }}
    }
  }
  return StCl.setup(config)
end

Config.smooth_cursor = function()
  local SC = require 'smoothcursor'
  local config = {
    type = 'exp',
    linehl = 'CursorLine',
    fancy = {
      enable = true,
      head = { cursor = '❥ ', texthl = 'SmoothCursor', linehl = 'CursorLine' },
      body = {
        { cursor = ' ', texthl = '@ibl.scope.char.1'  },
        { cursor = '🟏 ', texthl = '@ibl.indent.char.6' },
        { cursor = ' ', texthl = '@ibl.indent.char.5' },
        { cursor = '☿ ', texthl = '@ibl.indent.char.4' },
        { cursor = '⚸ ', texthl = '@ibl.indent.char.3' },
        { cursor = '✴ ', texthl = '@ibl.indent.char.2' },
        { cursor = ' ', texthl = '@ibl.indent.char.1' },
      },
      tail = { cursor = nil, texthl = 'SmoothCursor' }
    },
    disable_float_win = true,
    disabled_filetypes = {
      'qf',
      'man',
      'help',
      'neo-tree',
      'TelescopeResults',
      'TelescopePrompt',
    }
  }
  return SC.setup(config)
end

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
