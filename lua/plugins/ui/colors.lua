---@type LazySpec[]
return {
  {
    'eero-lehtinen/oklch-color-picker.nvim',
    opts = {},
    keys = {
      {
        '<leader>v',
        '<cmd>lua require("oklch-color-picker").pick_under_cursor()<cr>',
        desc = 'Oklch color-picker',
      },
    },
  },

  { 'rktjmp/lush.nvim', cmd = { 'Lushify' } },
  { 'rktjmp/shipwright.nvim', cmd = { 'Shipwright' } },


  {
    'echasnovski/mini.colors',
    version = false,
    opts = {},
  },

  {
    'echasnovski/mini.hipatterns',
    version = false,
    opts = {},
  },

  { require 'plugins.ui.colorizer' },
  { require 'plugins.ui.colorschemes' },

}

