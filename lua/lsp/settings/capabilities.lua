local cmp_lsp = require 'cmp_nvim_lsp'

local X = {}

---@return lsp.ClientCapabilities
function X.client_capabilities()
  return vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities(),
    {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = false
        }
      }
    }
  )
end

function X.capabilities(capabilities)
  capabilities = capabilities or
  vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
  )
  capabilities.workspace.didChangeWatchedFiles = {
    dynamicRegistration = false
  }

  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { 'markdown', 'plaintext' },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      }
    }
  }
  return capabilities
end

return X.client_capabilities()
