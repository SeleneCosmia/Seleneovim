local mason = require 'mason'
local masonlsp = require 'mason-lspconfig'

return {
  mason.setup({
    ui = {
      border = 'double',
      icons = {
        package_installed = ' ',
        package_pending = '󰴲 ',
        package_uninstalled = ' ',
      },
    },
  }),

  masonlsp.setup({
    handlers = nil,
    ensure_installed = {
      'bashls',
      'cssls',
      'crystalline',
      'efm',
      'html',
      'jsonls',
      'julials',
      'lua_ls',
      'taplo',
    },
  }),
}
