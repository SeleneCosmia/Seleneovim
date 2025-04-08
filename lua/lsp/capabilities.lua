local M = {}

function M.make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }

  capabilities.textDocument.completion.completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    snippetSupport = true,
    labelDetailsSupport = true,
    resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      },
    },
    documentationFormat = { 'markdown', 'plaintext' },
  }

  return require 'blink-cmp'.get_lsp_capabilities(capabilities, true)
end

return { make_capabilities = M.make_capabilities  }
