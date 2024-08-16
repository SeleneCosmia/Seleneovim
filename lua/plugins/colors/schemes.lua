return {
  { 'Biscuit-Colorscheme/nvim', name = 'biscuit' },

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
    priority = 10000,
    lazy = false,
    config = function()
      local osaka = require 'ui.colors'.osaka
      osaka.setup {}
      vim.cmd.colorscheme 'solarized-osaka-storm'
    end,
  },

  {
    'rockerBOO/boo-colorscheme-nvim',
    config = function()
      local boo = require 'boo-colorscheme'
      boo.setup({ italic = true })
    end,
  },

  { 'ptdewey/darkearth-nvim' },
}
