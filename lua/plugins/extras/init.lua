return {
  {
    '3rd/image.nvim',
    dependencies = { 'leafo/magick' },
    opts = {}
  },

  {
    'OXY2DEV/helpview.nvim',
    ft = 'help',
    dependencies = 'nvim-treesitter/nvim-treesitter'
  }
}
