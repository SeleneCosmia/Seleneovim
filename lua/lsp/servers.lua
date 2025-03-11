local on_attach = require 'lsp.settings.attach'.on_attach
local capabilities = require 'lsp.settings.capabilities'.capabilities

local X = {}

function X.init(lspconfig)
  local css_ft = { 'css', 'sass', 'scss', 'sss', 'sugarss' }
  local ts_ft = { 'javascript', 'typescript' }

  local server_setups = {
    language_servers = {
      'bashls',
      'marksman',
      'wgsl_analyzer',
    },
    preconfig_servers = {
      taplo = {},
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = '',
            },
            schemas = require 'schemastore'.yaml.schemas(),
          },
        },
      },
    },
    cssls = {
      filetypes = css_ft,
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = 'ignore',
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = 'ignore',
          },
        },
      },
    },
    html = {},
    jsonls = {
      settings = {
        json = {
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
          validate = { enable = true },
        },
      },
    },
    lua_ls = {
      ---@type lspconfig.settings.lua_ls
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
            autoRequire = false,
          },
          format = {
            enable = false
          },
          hint = {
            enable = true,
            setType = true,
          },
          codeLens = { enable = true },
        },
      },
    },
    julials = {
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
    },
    ts_ls = {
      filetypes = ts_ft,
      ---@type lspconfig.settings.ts_ls
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
    },
  }

  for server, config in pairs(server_setups) do
    if server == 'language_servers' then
      for _, ls in ipairs(config) do
        lspconfig[ls].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    elseif server == 'preconfig_servers' then
      for srv, cfg in ipairs(config) do
        lspconfig[srv].setup(config)
      end
    else
      if not config.on_attach then
        config.on_attach = on_attach
      end
      if not config.capabilities then
        config.capabilities = capabilities
      end
      lspconfig[server].setup(config)
    end
  end
end

return X
