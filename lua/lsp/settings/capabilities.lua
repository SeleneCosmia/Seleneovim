local cmp_lsp = require 'cmp_nvim_lsp'

local X = {}

X.capabilities = vim.tbl_deep_extend('force',
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities()
)

X.capabilities.textDocument.completion.completionItem.snippetSupport = true
X.capabilities.workspace.didChangeConfiguration.dynamicRegistration = false

-- function X.capabilities(capabilities)
--   capabilities = vim.tbl_deep_extend(
--     'force',
--     vim.lsp.protocol.make_client_capabilities(),
--     cmp_lsp.default_capabilities()
--   )
--   capabilities.workspace.didChangeWatchedFiles = {
--     dynamicRegistration = false
--   }
--
--   capabilities.textDocument.completion.completionItem = {
--     documentationFormat = { 'markdown', 'plaintext' },
--     snippetSupport = true,
--     preselectSupport = true,
--     insertReplaceSupport = true,
--     labelDetailsSupport = true,
--     resolveSupport = {
--       properties = {
--         'documentation',
--         'detail',
--         'additionalTextEdits',
--       }
--     }
--   }
--
--   return capabilities
-- end

return X
