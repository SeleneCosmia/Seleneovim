local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange.dynamicRegistration = false

capabilities.textDocument.completion.completionItem = {
  snippetSupport = true,
  insertReplaceSupport = true,
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

capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

return { capabilities = capabilities }
