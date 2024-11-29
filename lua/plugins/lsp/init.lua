return {
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        -- stylua: ignore start
        crystal = { 'crystal' },
        fish    = { 'fish_indent' },
        lua     = { 'stylua' },
        toml    = { 'taplo' },
        ['*']   = { 'trim_whitespace', 'trim_newlines' },
        -- stylua: ignore end
      },
      default_format_opts = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
    },
    keys = {
      { '<leader>ff', '<cmd>lua require("conform").format({})<cr>', { modes = { 'n', 'x' } } },
    },
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
      local on_attach = require 'lsp.settings.attach'.on_attach
      local publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
      ----------------------------------------------------------------
      require 'neoconf'.setup {}
      -------------- Mason setup
      require 'lsp.mason'.config()
      require 'lsp.mason'.mason_lspconfig()

      -------------- Diagnostics setup
      vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(publish_diagnostics, { update_in_insert = false })

      -------------- Server setups
      local servers = {
        'bashls',
        'cssls',
        'html',
        'glsl_analyzer',
        'lua_ls',
      }

      local defaults = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      for _, ls in ipairs(servers) do
        lspconfig[ls].setup(defaults)
      end

      ------------- Custom server setups
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
              },
            },
            validate = { enable = true },
          },
        },
      })

      lspconfig.taplo.setup({})

      lspconfig.julials.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          julia = {
            environmentPath = '~/.local/share/julia/environments/nvim-lspconfig',
            runtimeCompletions = true,
            editor = vim.fn.expand('$EDITOR'),
            usePlotPane = false,
            symbolCacheDownload = false,
            useProgressFrontend = false,
            NumThreads = 16,
            lint = { missingrefs = 'all' },
          },
        },
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

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          javascript = {
            preferences = {
              quoteStyle = 'single',
            },
          },
          typescript = {
            locale = 'en',
          },
        },
      })
    end,
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {},
  },

  { require 'plugins.lsp.lazydev' },
  { require 'plugins.lsp.ftplugins' },
}
