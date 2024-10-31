return {
  {
    'rktjmp/lush.nvim',
    cmd = { 'Lushify' },
    dependencies = {
      'rktjmp/shipwright.nvim',
      cmd = { 'Shipwright' },
    },
  },

  {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    config = true,
  },

  {
    'nvchad/minty',
    cmd = { 'Shades', 'Huefy' }
  },

  { require 'plugins.colors.schemes' },

  {
    'LmanTW/themify.nvim',
    enabled = false,
    config = function()
      require 'themify'.setup({
        'qaptoR-nvim/chocolatier.nvim',
        'defaults'
      })
    end
  },

}
