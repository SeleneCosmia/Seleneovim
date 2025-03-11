return {
  {
    'eero-lehtinen/oklch-color-picker.nvim',
    opts = {},
    keys = {
      {
        '<leader>v',
        '<Cmd>lua require("oklch-color-picker").pick_under_cursor()<CR>',
        desc = 'Open the oklch color-picker UI using the color under cursor',
      },
    },
  },

  { 'rktjmp/lush.nvim', cmd = { 'Lushify' } },
  { 'rktjmp/shipwright.nvim', cmd = { 'Shipwright' } },

  --- highlights colors in buffer
  { require 'plugins.ui.colorizer' },
}
