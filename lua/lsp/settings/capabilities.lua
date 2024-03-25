local cmp_lsp = require "cmp_nvim_lsp"

local X = {}

---@return lsp.ClientCapabilities
function X.client_capabilities()
    return vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities(),
      { workspace = {
          didChangeWatchedFiles = { dynamicRegistration = false }
      }}
    )
end

return X
