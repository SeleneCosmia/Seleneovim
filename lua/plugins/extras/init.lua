return {
  {
    '3rd/image.nvim',
    cond = os.getenv('TERM_PROGRAM') == 'kitty' or 'WezTerm',
    dependencies = { 'leafo/magick' },
    opts = {}
  },
  {
    'OXY2DEV/helpview.nvim',
    ft = 'help',
    dependencies = 'nvim-treesitter/nvim-treesitter'
  },
  { require 'plugins.extras.markdown' },
}
