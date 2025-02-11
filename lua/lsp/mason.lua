local M = {}
local mason, mason_lsp = require 'mason', require 'mason-lspconfig'
---@module 'mason'

M.mason_lspconfig = function()
  mason_lsp.setup({
    automatic_installation = true,
    ensure_installed = {
      'bashls',
      'cssls',
      'glsl_analyzer',
      'html',
      'jsonls',
      'julials',
      'lua_ls',
      'taplo',
      'yamlls'
    }
  })
end

M.config = function()
  ---@type MasonSettings
  mason.setup({
    ui = {
      border = 'rounded',
      height = 0.8,
      width = 0.75,
      icons = {
        package_installed = '',
        package_pending = '󰴲',
        package_uninstalled = '',
      },
    },
    registries = {
      'github:mason-org/mason-registry',
      'github:mkindberg/ghostty-ls'
    },
  })
end

return M
