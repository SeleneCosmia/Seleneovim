local M = {}
---@module 'mason'
local mason = require 'mason'
---@module 'mason-lspconfig'
local mason_lspconfig = require 'mason-lspconfig'

---@param plugin "'mason'"|"'mason-lspconfig'"
---@param opts? table
function M.setup(plugin, opts)
  if plugin == 'mason' then
    opts = {
      ui = {
        border = 'rounded',
        height = 0.8,
        width = 0.75,
        icons = {
          package_installed = '',
          package_pending = '󰴲',
          package_uninstalled = '',
        },
        registries = {
          'github:mason-org/mason-registry',
          'github:mkindberg/ghostty-ls',
        },
      },
    }
  elseif plugin == 'mason-lspconfig' then
    opts = {
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
        'yamlls',
      },
    }
  end
  return require(plugin).setup(opts)
end

return M
