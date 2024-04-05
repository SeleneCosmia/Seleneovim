return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufEnter' },
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'folke/neodev.nvim', ft = 'lua' },
            { 'folke/neoconf.nvim', cmd = 'Neoconf' },
            { 'creativenull/efmls-configs-nvim', version = false },
            { 'nvimtools/none-ls.nvim' },
        },
        config = function()
            local lspconfig = require 'lspconfig'
            local Capabilities = require 'lsp.init'.Capabilities()
            local neodev = require 'neodev'
            local neoconf = require 'neoconf'
            local fmt_on_attach = require 'lsp.autocommands'.format_on_attach
            local def_on_attach = require 'lsp.autocommands'.on_attach
            ----------------------------------------------------------------
            neodev.setup {}
            neoconf.setup {}
            -------------- Mason setup
            require 'lsp.mason'

            -------------- Diagnostics setup
            vim.lsp.handlers['textDocument/publishDiagnostics'] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = false })

            -------------- efmls setup
            local selene = require 'efmls-configs.linters.selene'
            local stylua = require 'efmls-configs.formatters.stylua'
            local shellcheck = require 'efmls-configs.linters.shellcheck'
            local f_lint = require 'efmls-configs.linters.fish'
            local fish_indent = require 'efmls-configs.formatters.fish_indent'

            local languages = {
                fish = { f_lint, fish_indent },
                lua = { selene, stylua },
                sh = { shellcheck },
            }
            local efmls_config = {
                filetypes = vim.tbl_keys(languages),
                settings = {
                    rootMarkers = { '.git/' },
                    languages = languages,
                },
                init_options = {
                    documentFormatting = true,
                    documentRangeFormatting = true,
                },
            }

            -------------- Server setups

            lspconfig.bashls.setup({
                capabilities = Capabilities,
                on_attach = def_on_attach,
            })

            lspconfig.cssls.setup({
                capabilities = Capabilities,
                on_attach = def_on_attach,
            })

            lspconfig.html.setup({
                capabilities = Capabilities,
                on_attach = def_on_attach,
            })

            lspconfig.crystalline.setup({
                capabilities = Capabilities,
                on_attach = def_on_attach,
                cmd = { 'crystalline', '--stdio' },
                single_file_support = true,
            })

            lspconfig.glsl_analyzer.setup({
                capabilities = Capabilities,
                on_attach = def_on_attach,
            })

            lspconfig.jsonls.setup({
                capabilities = Capabilities,
                on_attach = def_on_attach,
                settings = {
                    json = {
                        schemas = require 'schemastore'.json.schemas(),
                        validate = { enable = true },
                    },
                },
            })

            lspconfig.nushell.setup({})

            lspconfig.taplo.setup({})

            lspconfig.lua_ls.setup({
                capabilities = Capabilities,
                on_attach = def_on_attach,
            })

            lspconfig.vimls.setup({
                capabilities = Capabilities,
            })

            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = '',
                        },
                        schemas = require 'schemastore'.yaml.schemas(),
                    },
                },
            })

            lspconfig.efm.setup(vim.tbl_extend('force', efmls_config, {
                on_attach = fmt_on_attach,
            }))
        end,
    },
    { require 'plugins.lsp.ftplugins' },

    {
        'spywhere/detect-language.nvim',
        version = false,
        config = function()
            require 'detect-language'.setup {}
        end,
    },
}
