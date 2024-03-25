--# selene: allow(unused_variable)
---@diagnostic disable:unused-local
return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = { 'Telescope' },
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'benfowler/telescope-luasnip.nvim' },
            { 'mrjones2014/tldr.nvim' },
            { 'nat-418/telescope-color-names.nvim' },
        },
        config = function()
            local telescope = require 'telescope'
            local action = require 'telescope.actions'
            local TSLayout = require 'telescope.pickers.layout'
            local util = require 'telescope.utils'

            local n_layout = require 'nui.layout'
            local n_popup = require 'nui.popup'


            telescope.setup({
                defaults = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        horizontal = {
                            width = 0.85,
                            height = 0.6,
                        },
                        vertical = {
                            anchor = 'CENTER',
                            height = 0.9,
                            width = 0.9,
                            prompt_position = 'top',
                        },
                    },
                    wrap_result = false,
                    mappings = {
                        i = {
                            ['<esc>'] = action.close,
                            ['<C-l>'] = action.preview_scrolling_right,
                            ['<C-h>'] = action.preview_scrolling_left,
                            ['<C-j>'] = action.preview_scrolling_down,
                            ['<C-k>'] = action.preview_scrolling_up,
                        },
                        n = {
                            ['<C-l>'] = action.preview_scrolling_right,
                            ['<C-h>'] = action.preview_scrolling_left,
                            ['<C-j>'] = action.preview_scrolling_down,
                            ['<C-k>'] = action.preview_scrolling_up,
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
                        tldr_args = '--color always'
                    },
                    ['ui-select'] = {
                        require 'telescope.themes'.get_dropdown(),
                    },
                },
            })

            telescope.load_extension('fzf')
            telescope.load_extension('ui-select')
            telescope.load_extension('color_names')
            telescope.load_extension('luasnip')

            local builtin = require 'telescope.builtin'
            local keymap = vim.keymap.set
            keymap('n', '<leader>sh', builtin.highlights, { desc = 'Display highlights in Telescope' })
        end,
    },
}
