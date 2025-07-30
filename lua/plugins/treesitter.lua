---@diagnostic disable:inject-field

---@type LazySpec[]
return {
  { 'bezhermoso/tree-sitter-ghostty', build = 'make nvim_install' },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    ---@module 'nvim-treesitter'
    opts = {},
  },

  {
    'Fymyte/rasi.vim',
    build = ':TSInstall rasi',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'rasi',
  },
}
