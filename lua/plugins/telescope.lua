---@diagnostic disable:unused-local
return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
      { '<leader>bh', ':Telescope highlights<CR>' }
    },
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'benfowler/telescope-luasnip.nvim' },
      { 'tsakirist/telescope-lazy.nvim' },
      { 'mrjones2014/tldr.nvim' },
      { 'nat-418/telescope-color-names.nvim' },
    },
    config = function()
      local telescope = require 'telescope'
      local act       = require 'telescope.actions'
      local tsl       = require 'telescope.pickers.layout'
      local util      = require 'telescope.utils'
  -- |----------------------------------------------------------------------|
      local names = { 'fzf', 'ui-select', 'color_names', 'luasnip', 'lazy' }
        for _, name in pairs(names) do
          telescope.load_extension(name)
        end

      telescope.setup({
        defaults = {
          layout_config = {
            horizontal = {
              width = 0.85,
              height = 0.7,
            },
            vertical = {
              anchor = 'CENTER',
              height = 0.75,
              width = 0.85,
              prompt_position = 'top',
            },
          },
          layout_strategy = 'vertical',
          wrap_result = false,
          mappings = {
            i = {
              ['<esc>'] = act.close,
              ['<C-l>'] = act.preview_scrolling_right,
              ['<C-h>'] = act.preview_scrolling_left,
              ['<C-j>'] = act.preview_scrolling_down,
              ['<C-k>'] = act.preview_scrolling_up,
            },
            n = {
              ['<C-l>'] = act.preview_scrolling_right,
              ['<C-h>'] = act.preview_scrolling_left,
              ['<C-j>'] = act.preview_scrolling_down,
              ['<C-k>'] = act.preview_scrolling_up,
            },
          },
        },
        pickers = {
          planets = { show_moon = true, show_pluto = true },
        },
        extensions = {

          ['fzf'] = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
          ['tldr'] = {
            tldr_args = '--color always',
          },
          ['ui-select'] = {
            require 'telescope.themes'.get_dropdown(),
          },
        },
      })

    end,
  },
}
