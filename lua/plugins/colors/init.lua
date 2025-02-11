return {
  {
    'eero-lehtinen/oklch-color-picker.nvim',
    opts = {},
    keys = {
      {
        '<leader>v',
        '<cmd>lua require("oklch-color-picker").pick_under_cursor()<cr>',
        desc = 'Open the color picker UI using the color under cursor',
      },
    },
  },

  { 'rktjmp/lush.nvim', cmd = { 'Lushify' } },
  { 'rktjmp/shipwright.nvim', cmd = { 'Shipwright' } },

  { require 'plugins.colors.schemes' },
  { require 'plugins.colors.colorizer' },
}
