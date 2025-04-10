local on_attach = require 'lsp.settings.attach'.on_attach
local capabilities = require 'lsp.settings.capabilities'.capabilities

local M = {}

function M.setup()
  local setup_server = require 'lsp.config'.setup_server

  setup_server('bashls')
  setup_server('cssls')
  setup_server('fish_lsp')
  setup_server('gleam')
  setup_server('glsl_analyzer')
  setup_server('html')
  setup_server('marksman')
  setup_server('nushell')
  setup_server('openscad_lsp')
  setup_server('wgsl_analyzer')
  setup_server('zls')

  setup_server('jsonls', {
    settings = {
      json = {
        validate = { enable = true },
        schemas = require 'schemastore'.json.schemas({
          extra = {
            {
              description = 'LuaLS server schema',
              fileMatch = { 'luarc.json', '.luarc.json' },
              name = '.luarc.json',
              url = 'https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json',
            },
          },
        }),
      },
    },
    -- Lazy load schemas.
    on_new_config = function(config)
      config.settings.json.schemas = config.settings.json.schemas or {}
      vim.list_extend(config.settings.json.schemas, require('schemastore').json.schemas())
    end,
  })

  setup_server('julials', {
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

  setup_server('lua_ls', {
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
        format = { enable = false },
        hint = { enable = true, setType = true },
        codeLens = { enable = true },
      },
    },
  })

  setup_server('taplo', {
    settings = {
      taplo = {
        configFile = { enabled = true },
        schema = {
          enabled = true,
          catalogs = { 'https://www.schemastore.org/api/json/catalog.json' },
          cache = {
            memoryExpiration = 60,
            diskExpiration = 600,
          },
        },
      },
    },
  })

  setup_server('ts_ls', {
    settings = {
      javascript = {
        preferences = {
          quoteStyle = 'single',
        },
      },
      typescript = {
        preferences = {
          quoteStyle = 'single',
        },
        locale = 'en',
      },
    },
  })

  setup_server('yamlls', {
    settings = {
      yaml = {
        schemastore = {
          enable = false,
          url = '',
        },
      },
    },
    on_new_config = function(config)
      config.settings.yaml.schemas = config.settings.yaml.schemas or {}
      vim.list_extend(config.settings.yaml.schemas, require('schemastore').yaml.schemas())
    end,
  })
end

return M
