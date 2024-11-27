local M = {}
local mason, mason_lsp = require 'mason', require 'mason-lspconfig'

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
  mason.setup({
    ui = {
      border = 'rounded',
      icons = {
        package_installed = '',
        package_pending = '󰴲',
        package_uninstalled = '',
      },
    },
  })
end

return M
