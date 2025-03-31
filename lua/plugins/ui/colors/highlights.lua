---@type LazySpec[]
return {
  {
    'echasnovski/mini.hipatterns',
    version = false,
    config = function()
      ---@module 'mini.hipatterns'
      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup({
        highlighters = {
          -- todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        },
      })
    end,
  },

  {
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    config = function()
      ---@module 'ccc'
      local ccc = require 'ccc'
      ccc.setup({
        highlighter = {
          auto_enable = true,
          filetypes = {},
          excludes = {
            'noice',
            'cmp_docs',
            'blink-cmp-documentation',
            'TelescopePrompt',
            'snacks',
            'help',
            'man',
            'qf'
          },
          lsp = true,
        },
        pickers = {
          ccc.picker.hex_long,
          ccc.picker.hex_short,
          ccc.picker.css_rgb,
          ccc.picker.css_hsl,
          ccc.picker.css_oklab,
          ccc.picker.css_oklch,
          ccc.picker.css_lab,
          ccc.picker.css_lch,
          ccc.picker.css_name,
        },
      })
    end,
  },
}
