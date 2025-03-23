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

  --- highlights colors in buffer
  { require 'plugins.ui.colorizer' },

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

}

