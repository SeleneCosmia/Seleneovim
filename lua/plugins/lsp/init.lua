return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        crystal = { 'crystal' },
        fish = { 'fish_indent' },
      }
    }
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require 'lsp.settings.capabilities'.capabilities
      local neoconf = require 'neoconf'
      local on_attach = require 'lsp.autocommands'.on_attach
      local publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
      ----------------------------------------------------------------
      neoconf.setup {}
      -------------- Mason setup
      require 'lsp.mason'.config()
      require 'lsp.mason'.mason_lspconfig()

      -------------- Diagnostics setup
      vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(publish_diagnostics, { update_in_insert = false })

      -------------- Server setups
      local defaults = {
        capabilities = capabilities,
        on_attach = on_attach
      }
      -- local servers = { 'bashls', 'cssls', 'html', 'ts_ls', 'glsl_analyzer' }

      lspconfig.bashls.setup(defaults)
      lspconfig.cssls.setup(defaults)
      lspconfig.html.setup(defaults)

      lspconfig.crystalline.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { 'crystalline', '--stdio' },
        single_file_support = true,
      })

      lspconfig.glsl_analyzer.setup(defaults)

      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          json = {
            schemas = require 'schemastore'.json.schemas {
              extra = {
                {
                  description = 'LuaLS server schema',
                  fileMatch = { 'luarc.json', '.luarc.json' },
                  name = '.luarc.json',
                  url = 'https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json',
                },
              }
            },
            validate = { enable = true },
          },
        },
      })

      lspconfig.taplo.setup({})

      lspconfig.lua_ls.setup(defaults)

      lspconfig.julials.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        ---@type lspconfig.settings.julials
        settings = {
          julia = {
            environmentPath = '~/.local/share/julia/environments/nvim-lspconfig',
            runtimeCompletions = true,
            editor = vim.fn.expand('$EDITOR'),
            usePlotPane = false,
            symbolCacheDownload = false,
            useProgressFrontend = false,
            NumThreads = 16,
            lint = { missingrefs = "all" }
          }
        }
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

      ---@type lspconfig.options.ts_ls
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        ---@type lspconfig.settings.ts_ls
        settings = {
          javascript = {
            preferences = {
              quoteStyle = 'single'
            }
          },
          typescript = {
            locale = 'en',
          }
        }
      })
    end,
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {}
  },

  { 'creativenull/efmls-configs-nvim', enabled = false },

  { require 'plugins.lsp.lazydev' },
  { require 'plugins.lsp.ftplugins' },
}
