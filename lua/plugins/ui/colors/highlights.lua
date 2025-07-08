local hl_fts = {
  'css',
  'lua',
  'rasi',
  'scss',
  'sass',
  'stylus',
}

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
    ft = hl_fts,
    cmd = 'CccPick',
    opts = function()
      ---@module 'ccc'
      local ccc = require 'ccc'

      ccc.output.hex.setup { uppercase = true }

      ---@type ccc.Options
      return {
        highlighter = {
          auto_enable = true,
          filetypes = hl_fts,
          lsp = true,
        },
        inputs = {
          ccc.input.rgb,
          ccc.input.hsl,
          ccc.input.oklab,
          ccc.input.oklch,
          ccc.input.hsluv,
          ccc.input.lab,
          ccc.input.xyz,
        },
        outputs = {
          ccc.output.hex,
          ccc.output.css_rgb,
          ccc.output.css_rgba,
          ccc.output.css_hsl,
          ccc.output.css_lab,
          ccc.output.css_lch,
          ccc.output.css_oklab,
          ccc.output.css_oklch,
          ccc.output.float,
        },
        pickers = {
          ccc.picker.hex,
          ccc.picker.css_rgb,
          ccc.picker.css_hsl,
          ccc.picker.css_oklab,
          ccc.picker.css_oklch,
          ccc.picker.css_lab,
          ccc.picker.css_lch,
          ccc.picker.css_hwb,
        },
        recognize = {
          input = true,
        }
      }
    end,
  },
}
