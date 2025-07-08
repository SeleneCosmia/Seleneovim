require 'lsp.config.diagnostics'
require 'lsp.config'

vim.lsp.config('*', {
  ---@diagnostic disable-next-line: param-type-mismatch
  capabilities = require 'lsp.capabilities'.make_capabilities(),
})
