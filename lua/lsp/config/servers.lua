vim.lsp.config('jsonls', {
  settings = {
    ['json'] = {
      validate = { enable = true },
      schemas = require 'schemastore'.json.schemas({
        extra = {
          {
            name = 'Lua Language Server Config',
            description = 'Lua language server configuration file',
            fileMatch = { 'luarc.json', '.luarc.json' },
            url = 'https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json',
          },
        },
      }),
    },
  },
})

vim.lsp.config('yamlls', {
  settings = {
    ['yaml'] = {
      schemastore = {
        enable = false,
        url = '',
      },
      schemas = require 'schemastore'.yaml.schemas(),
    },
  },
})

-- setup_server('julials', {
--   settings = {
--     julia = {
--       environmentPath = '~/.local/share/julia/environments/nvim-lspconfig',
--       runtimeCompletions = true,
--       editor = vim.fn.expand('$EDITOR'),
--       usePlotPane = false,
--       symbolCacheDownload = false,
--       useProgressFrontend = false,
--       NumThreads = 16,
--       lint = { missingrefs = 'all' },
--     },
--   },
-- })

vim.lsp.enable({
  'bashls',
  'biome',
  'cssls',
  'css_variables',
  'fish_lsp',
  'gh_actions_ls',
  'gleam',
  'glsl_analyzer',
  'html',
  'jsonls',
  'julials',
  'lua_ls',
  'marksman',
  'nushell',
  'openscad_lsp',
  'taplo',
  'ts_ls',
  'wgsl_analyzer',
  'yamlls',
  'zls',
})
