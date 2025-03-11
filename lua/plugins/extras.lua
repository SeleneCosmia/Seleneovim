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
  },

  {
    'echasnovski/mini.misc',
    version = false,
    config = function()
      require 'mini.misc'.setup()
      MiniMisc.setup_termbg_sync()
    end
  }

  -- {
  --   'rachartier/tiny-glimmer.nvim',
  --   event = 'VeryLazy',
  --   opts = {}
  -- }

}
