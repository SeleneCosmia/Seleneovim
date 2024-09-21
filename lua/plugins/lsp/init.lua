return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufEnter' },
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'folke/neoconf.nvim', cmd = 'Neoconf' },
      { 'creativenull/efmls-configs-nvim', version = false },
      { 'nvimtools/none-ls.nvim', enabled = false },
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local Capabilities = require 'lsp.init'.Capabilities()
      local neoconf = require 'neoconf'
      local fmt_on_attach = require 'lsp.autocommands'.format_on_attach
      local def_on_attach = require 'lsp.autocommands'.on_attach
      ----------------------------------------------------------------
      neoconf.setup {}
      -------------- Mason setup
      require 'lsp.mason'

      -------------- Diagnostics setup
      vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { update_in_insert = false })


      -------------- efmls setup
      local stylua = require 'efmls-configs.formatters.stylua'
      local shellcheck = require 'efmls-configs.linters.shellcheck'
      local f_lint = require 'efmls-configs.linters.fish'
      local fish_indent = require 'efmls-configs.formatters.fish_indent'

      local languages = {
        fish = { f_lint, fish_indent },
        lua = { stylua },
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

      -- TODO)) Make file for defining lspServers and --
      -- TODO)) make these seperate setup calls into as few as possible --

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
            schemas = require 'schemastore'.json.schemas {
              extra = {
                {
                  description = 'LuaLS (sumneko_lua) server schema',
                  fileMatch = { 'luarc.json', '.luarc.json' },
                  name = 'luarc.json',
                  url = 'https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json',
                },
              }
            },
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

      lspconfig.julials.setup({
        capabilities = Capabilities,
        on_attach = def_on_attach,
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

      lspconfig.efm.setup(vim.tbl_extend('force', efmls_config, {
        on_attach = fmt_on_attach,
      }))
    end,
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {}
  },

  { require 'plugins.lsp.lazydev' },
  { require 'plugins.lsp.ftplugins' },
}
