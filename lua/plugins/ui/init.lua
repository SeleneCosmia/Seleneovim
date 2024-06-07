return {
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'ColorScheme',
        main = 'ibl',
        config = function()
            require 'plugins.ui.ibl'
        end,
    },

    { 'tzachar/highlight-undo.nvim', opts = {} },

    {
        'grapp-dev/nui-components.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
    },

    {
        'rcarriga/nvim-notify',
        event = 'VeryLazy',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require 'config.notify'
        end,
    },

    {
        'nvimdev/hlsearch.nvim',
        event = 'BufRead',
        opts = {},
    },

    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        config = function()
            require 'config.noice'
        end,
    },

    {
        'tamton-aquib/flirt.nvim',
        event = 'VeryLazy',
        config = function()
            require 'flirt'.setup {
                close_command = 'Q',
                exclude_fts = {
                    'notify',
                    'cmp_menu',
                    'lazy',
                    'neo-tree-popup',
                    'popup'
                },
            }
        end,
    },

    {
        'willothy/nvim-cokeline',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {},
    },

    {
        'luukvbaal/statuscol.nvim',
        lazy = false,
        event = 'UiEnter',
        opts = function()
            require 'config.statuscolumn'
        end,
    },

    {
        'rachartier/tiny-devicons-auto-colors.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = 'VeryLazy',
        config = function()
            require 'config.devicons'
        end
    },

    {
        'SeleneCosmia/rainbow-delimiters.nvim',
        config = function()
            local g = vim.g
            local rd = require 'rainbow-delimiters'

            g.rainbow_delimiters = {
                strategy = {
                    [''] = rd.strategy['global'],
                    vim = rd.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                },
                priority = {
                    [''] = 110,
                },
            }
        end,
    },

    { 'gorbit99/codewindow.nvim', enabled = false },

    {
        'gen740/SmoothCursor.nvim',
        event = 'BufEnter',
        config = function()
            require 'config.smooth_cursor'.config()
        end,
    },

    {
        'mvllow/modes.nvim',
        event = 'VeryLazy',
        enabled = true,
        config = function()
            require 'modes'.setup({
                ignore_filetypes = {
                    'neo-tree',
                    'TelescopePrompt',
                    'notify',
                    'lazy',
                    'cmp_menu',
                },
            })
        end,
    },
}
