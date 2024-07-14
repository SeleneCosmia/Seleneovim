---@diagnostic disable:inject-field

return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            local treesitter = require 'nvim-treesitter.configs'
            local pc = require 'nvim-treesitter.parsers'.get_parser_configs()
            local default_parsers = require 'utils.globals'.ts_parsers

            pc.crystal = {
                install_info = {
                    url = 'https://github.com/crystal-lang-tools/tree-sitter',
                    files = { 'src/parser.c' },
                    branch = 'main',
                },
                filetype = 'crystal',
                maintainers = { '@crystal-lang-tools' },
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

