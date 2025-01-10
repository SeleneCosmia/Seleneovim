---@module 'lazy'
---@type LazySpec
return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      user_default_options = {
        RRGGBBAA = true,
        css_fn = true,
        always_update = true,
      },
    },
  },

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
  ----------------------------------------| disabled plugins
  {
    'nvchad/minty',
    enabled = false,
    cmd = { 'Shades', 'Huefy' },
  },
}
