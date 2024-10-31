return {
  { 'Biscuit-Colorscheme/nvim', name = 'biscuit' },
  { 'ptdewey/darkearth-nvim' },

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
    'luisiacc/gruvbox-baby',
    enabled = false,
    config = function()
      local gruvbox = require 'ui.colors'.gruvbox
      gruvbox.setup()
    end,
  },

  {
    'lmburns/kimbox',
    config = function()
      local kimbox = require 'ui.colors'.kimbox
      kimbox.setup {}
    end,
  },

  {
    'craftzdog/solarized-osaka.nvim',
    config = function()
      local osaka = require 'ui.colors'.osaka
      osaka.setup {}
    end,
  },

  {
    'rockerBOO/boo-colorscheme-nvim',
    config = function()
      local boo = require 'boo-colorscheme'
      boo.setup({ italic = true })
    end,
  },

}
