---@type LazySpec[]
return {
  {
    'Fymyte/rasi.vim',
    build = ':TSInstall rasi',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'rasi',
  },

  { 'jlcrochet/vim-crystal', ft = 'crystal' },

  {
    'farias-hecdin/CSSVarHighlight',
    ft = 'css',
    dependencies = { 'echasnovski/mini.hipatterns' },
    opts = {},
  },

  {
    'farias-hecdin/CSSVarViewer',
    ft = 'css',
    opts = {},
  },
}
