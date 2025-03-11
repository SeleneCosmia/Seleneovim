return {
  { 'Biscuit-Colorscheme/nvim', name = 'biscuit' },
  { 'ptdewey/darkearth-nvim' },

  {
    'rockerBOO/boo-colorscheme-nvim',
    config = function()
      local boo = require 'boo-colorscheme'
      boo.setup({ italic = true })
    end,
  },

  {
    'ray-x/starry.nvim',
    config = function()
      local opts = {
        italics = {
          functions = true,
          variables = true,
        },
      }
      require 'starry'.setup(opts)
    end,
  },

  {
    'lmburns/kimbox',
    config = function()
      local kimbox = require 'ui.colors'.kimbox
      kimbox.setup {}
    end,
  },
}
