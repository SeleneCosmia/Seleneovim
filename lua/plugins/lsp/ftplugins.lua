return {
  {
    'Fymyte/rasi.vim',
    build = ':TSInstall rasi',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'rasi',
  },

  { 'jlcrochet/vim-crystal', ft = 'crystal' },
}
