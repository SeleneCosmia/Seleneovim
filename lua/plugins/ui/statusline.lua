---@module 'lazy'
---@type LazySpec[]
return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'lualine'.setup({})
    end,
  },
}
