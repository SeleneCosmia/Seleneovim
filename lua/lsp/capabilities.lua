local cmp_lsp, lsp = require 'cmp_nvim_lsp', vim.lsp
local make_capabilities = lsp.protocol.make_client_capabilities()

local X = {}

---@return lsp.ClientCapabilities
function X.client_capabilities()
  return vim.tbl_deep_extend('force', make_capabilities(), cmp_lsp.default_capabilities(), {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = false,
      },
    },
  })
end

return X
