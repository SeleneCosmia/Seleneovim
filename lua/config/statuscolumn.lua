local builtin = require 'statuscol.builtin'
local X = {}

X.config = {
  relculright = true,
  ft_ignore = {
    'mason',
    'qf',
    'lazy',
    'noice',
    'neo-tree',
    'neo-tree-popup',
    'help',
  },
  segments = {
    {
      text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
    {
      sign = {
        namespace = { 'Diagnostic*', '.*' },
        maxwidth = 2,
        colwidth = 2,
      },
      auto = true,
      condition = { true, builtin.not_empty },
      click = 'v:lua.ScSa',
    }, {
      text = { '', builtin.lnumfunc, ' ' },
      condition = { true, builtin.not_empty },
      click = 'v:lua.ScLa',
    }
  },
}
