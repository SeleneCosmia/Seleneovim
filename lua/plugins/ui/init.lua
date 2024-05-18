---@diagnostic disable:missing-fields
return {
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'ColorScheme',
        main = 'ibl',
        config = function()
            require 'plugins.ui.ibl'
        end,
    },

    {
        'MunifTanjim/nui.nvim',
        lazy = true
    },

    {
        'rcarriga/nvim-notify',
        event = 'VeryLazy',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function(min_w, max_w)
          local notify = require 'notify'
            min_w = math.floor(vim.api.nvim_win_get_width(0) / 4)
            max_w = math.ceil(vim.api.nvim_win_get_width(0) * 0.345)

            notify.setup({
                background_colour = '#282828',
                minimum_width = min_w,
                max_width = max_w,
                stages = 'slide',
                timeout = 6000,
            })
        end
    },

    {
        'nvimdev/hlsearch.nvim',
        event = 'BufReadPost',
        opts = {}
    },

    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        config = function()
            require 'plugins.ui.noice'
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
                    'neo-tree-popup'
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
          local builtin = require 'statuscol.builtin'
          return {
              setopt = true,
              ft_ignore = {
                'neo-tree',
                'help'
              },
              segments = {
                {
                  text = { builtin.foldfunc },
                  click = 'v:lua.ScFa',
                  maxwidth = 1,
                  colwidth = 1,
                  auto = false,
                },
                {
                  sign = {
                      namespace = { '.*', 'Diagnostic*', '.*' },
                      maxwidth = 2,
                      colwidth = 2,
                    },
                    auto = true,
                    click = 'v:lua.ScSa',
                    condition = { true, builtin.not_empty }
                },
                {
                  text = { builtin.lnumfunc, ' ' },
                  click = 'v:lua.ScLa',
                  condition = { true, builtin.not_empty }
                },
                {
                  text = { '┇' },
                  hl = 'Todo',
                  condition = { true, builtin.not_empty }
                },
                { text = { ' ' } }
              }
            }
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
                    vim = rd.strategy['local']
                },
                query = {
                    [''] = 'rainbow-delimiters',
                },
                priority = {
                    [''] = 110,
                },
            }
        end
    },

    {
        'gorbit99/codewindow.nvim',
        config = function()
            require 'plugins.ui.codewindow'
        end,
    },

    {
        'gen740/SmoothCursor.nvim',
        event = 'BufEnter',
        config = function()
            require 'ui.configs.smooth_cursor'.config()
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
                    'cmp_menu'
                }
            })
        end
    },
}
