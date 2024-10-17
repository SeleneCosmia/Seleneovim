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

  { require 'plugins.colors.schemes' },
  {
    'LmanTW/themify.nvim',
    enabled = false, -- [WARN] suuuuuper buggy rn :(
    lazy = false,
    priority = 999,
    cmd = 'Themify',
    config = function()
      require 'themify'.setup({
        'qaptoR-nvim/chocolatier.nvim'
      })
    end
  },
}
