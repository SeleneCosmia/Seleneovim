---@type LazySpec[]
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = false,
    lazy = true,
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      completions = {
        lsp = { enabled = true },
      },
      bullet = {
        icons = { '', '󱞪', '󰨃', '󰜴' },
      },
      code = {
        width = 'block',
        min_width = 45,
      },
      html = {
        enabled = true,
        comment = { conceal = false },
      },
      sign = {
        enabled = false,
      },
      checkbox = {
        checked = {
          scope_highlight = '@markup.strikethrough',
        },
      },
    },
  },

  {
    'OXY2DEV/markview.nvim',
    ft = 'markdown',
    dependencies = {
      'saghen/blink.cmp'
    }
  }
}
