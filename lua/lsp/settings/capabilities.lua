local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange.dynamicRegistration = false

capabilities.textDocument.completion.completionItem = {
  commitCharactersSupport = true,
  deprecatedSupport = true,
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = { 'documentation', 'detail', 'additionalTextEdits' },
  },
  documentationFormat = { 'markdown', 'plaintext' },
}

capabilities.textDocument.codeAction = {
  dynamicRegistration = true,
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = (function()
        local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
        table.sort(res)
        return res
      end)(),
    },
  },
}

capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

return { capabilities = capabilities }
