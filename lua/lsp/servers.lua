local on_attach = require 'lsp.settings.attach'.on_attach
local capabilities = require 'lsp.settings.capabilities'.capabilities
local snippet_capabilities = require 'lsp.settings.capabilities'.snippet_capabilities

local X = {}

function X.init(lspconfig)
  local css_ft = { 'css', 'sass', 'scss', 'sss' }
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
      capabilities = snippet_capabilities,
      filetypes = css_ft,
      settings = {
        css = {
          validate = true, lint = {
            unknownAtRules = 'ignore',
        } },
        scss = {
          validate = true, lint = {
            unknownAtRules = 'ignore',
        } },
      },
    },
    html = {
      capabilities = snippet_capabilities,
    },
    jsonls = {
      capabilities = snippet_capabilities,
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
      hint = {
        enable = false,
      }
    },
    julials = {
      capabilities = capabilities,
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
      capabilities = snippet_capabilities,
      filetypes = ts_ft,
      settings = {
        javascript = {
          preferences = {
            quoteStyle = 'single',
          },
        },
        typescript = { locale = 'en' },
      },
    },
  }

  for server, cfg in pairs(server_setups) do
    if server == 'language_servers' then
      for _, ls in ipairs(cfg) do
        lspconfig[ls].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    elseif server == 'preconfig_servers' then
      for srv, config in ipairs(cfg) do
        lspconfig[srv].setup(config)
      end
    else
      if not cfg.on_attach then
        cfg.on_attach = on_attach
      end
      if not cfg.capabilities then
        cfg.capabilities = snippet_capabilities
      end
      lspconfig[server].setup(cfg)
    end
  end
end

return X
