---@type LazySpec[]
return {
  { 'Biscuit-Colorscheme/nvim', name = 'biscuit' },
  { 'ptdewey/darkearth-nvim' },
  { 'pustota-theme/pustota.nvim' },

  {
    'sponkurtus2/angelic.nvim',
    lazy = false,
  },

  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    opts = {
      sidebars = { 'neo-tree' }
    }
  },

  {
    'rockerBOO/boo-colorscheme-nvim',
    lazy = false,
    config = function()
      local boo = require 'boo-colorscheme'
      boo.setup({ italic = true })
    end,
  },

  {
    'ray-x/starry.nvim',
    lazy = false,
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
    'shoenot/witchesbrew.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
  },
}
