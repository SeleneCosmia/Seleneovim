local Hydra = require 'hydra'
local cmd = require 'hydra.keymap-util'.cmd

local hint = [[
  _a_: new tabpage
  _c_: close current tab
  _x_: close other tabs
]]


Hydra({
  name = 'Tab Pages',
  hint = hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      show_name = false,
      position = { 'bottom' },
      float_opts = {
        style = 'minimal',
        border = 'single',
      },
    },
  },
  mode = 'n',
  body = '<Leader><Tab>',
  heads = {
    { 'a', cmd 'tabnew' },
    { 'c', cmd 'tabclose!'  },
    { 'x', cmd 'tabonly' },
    { '<Esc>', nil, { exit = true, nowait = true, desc = false } },
  },
})
