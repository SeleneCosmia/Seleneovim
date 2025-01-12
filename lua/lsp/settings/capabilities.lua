local cmp_lsp = require 'cmp_nvim_lsp'

local capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities()
)

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities.workspace.didChangeConfiguration = {
  dynamicRegistration = false,
}

local snip_caps = vim.lsp.protocol.make_client_capabilities()
snip_caps.textDocument.completion.completionItem.snippetSupport = true

local snippet_capabilities = vim.tbl_deep_extend('keep', capabilities, snip_caps)

return {
  capabilities = capabilities,
  snippet_capabilities = snippet_capabilities
}
