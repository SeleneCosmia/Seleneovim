local o = vim.opt
local hl = require 'utils.globals'.hl
local ibl, hooks = require 'ibl', require 'ibl.hooks'
---@diagnostic disable:unused-local
o.list = true

local highlight = {
  'LzFlag1',
  'LzFlag2',
  'LzFlag3',
  'LzFlag4',
  'LzFlag5',
  'LzFlag6',
}
local bilight = {
  'BiFlag1',
  'BiFlag2',
  'BiFlag3',
  'BiFlag4',
  'BiFlag5',
  'BiFlag6',
}
--  ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
--           create hl groups in the hl setup hook
--       this enables ibl to reset on colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  hl(0, 'LzFlag1', { fg = '#D52D00' })
  hl(0, 'LzFlag2', { fg = '#EF7627' })
  hl(0, 'LzFlag3', { fg = '#FF9A56' })
  hl(0, 'LzFlag4', { fg = '#D162A4' })
  hl(0, 'LzFlag5', { fg = '#B55690' })
  hl(0, 'LzFlag6', { fg = '#A30262' })
end)

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  hl(0, 'BiFlag1', { fg = '#F72585' })
  hl(0, 'BiFlag2', { fg = '#B5179E' })
  hl(0, 'BiFlag3', { fg = '#7209B7' })
  hl(0, 'BiFlag4', { fg = '#3A0CA3' })
  hl(0, 'BiFlag5', { fg = '#4361EE' })
  hl(0, 'BiFlag6', { fg = '#4CC9F0' })
end)

---@type ibl.config
ibl.setup {
  indent = {
    char = '│',
    highlight = highlight,
    smart_indent_cap = true,
  },
  scope = { enabled = false },
  exclude = {
    buftypes = { 'terminal', 'telescope', 'nofile', 'quickfix', 'prompt' },
    filetypes = {
      'markdown',
      'mason',
      'neo-tree',
      'lazy',
      'checkhealth',
      'dashboard',
      'help',
      'notify',
      'man',
      'TelescopePrompt',
      'qf',
    },
  },
}
