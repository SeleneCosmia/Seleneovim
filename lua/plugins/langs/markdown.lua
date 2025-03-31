---@type LazySpec[]
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = {
        lsp = { enabled = true }
      },
      bullet = {
        icons = { '', '󱞪', '󰨃', '󰜴' },
      },
      code = { width = 'block', min_width = 45, },
      html = {
        enabled = true,
        comment = { conceal = false },
      },
      sign = { enabled = false },
    },
  },
}
