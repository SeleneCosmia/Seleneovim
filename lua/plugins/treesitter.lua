---@diagnostic disable:inject-field

return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            local treesitter = require 'nvim-treesitter.configs'
            local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
            local default_parsers = require 'utils.globals'.ts_parsers



            ---@class ParserInfo
            parser_config.crystal = {
                install_info = {
                    url = 'https://github.com/crystal-lang-tools/tree-sitter',
                    files = { 'src/parser.c' },
                    branch = 'main',
                },
                filetype = 'crystal',
                maintainers = { '@crystal-lang-tools' },
            }

            ---@class ParserInfo
            parser_config.cyber = {
                install_info = {
                    url = 'https://github.com/instance-id/tree-sitter-cyber',
                    files = { 'src/parser.c' },
                    branch = 'master',
                },
                filetype = 'cyber',
                maintainers = { '@instance-id' },
            }

            ---@class ParserInfo
            parser_config.faye = {
                install_info = {
                    url = 'https://codeberg.org/faye/tree-sitter',
                    files = { 'src/parser.c' },
                    branch = 'master',
                },
                filetype = 'faye',
                maintainers = { '@fawn' },
            }

            treesitter.setup({
                ensure_installed = default_parsers,
                sync_install = true,
                auto_install = true,
                indent = { enable = false },
                highlight = {
                    enable = true,
                    use_languagetree = true,
                    additional_vim_regex_highlighting = {
                        'bash',
                        'crystal',
                    },
                },

                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = { 'BufWrite', 'CursorHold' },
                },
            })
        end,
    },

    {
        'windwp/nvim-ts-autotag',
        opts = {}
    }
}

