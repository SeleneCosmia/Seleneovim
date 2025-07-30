vim.lsp.config('*', {
  ---@diagnostic disable-next-line: param-type-mismatch
  capabilities = require 'lsp.capabilities'.make_capabilities(),
})

require 'lsp.diagnostics'
require 'lsp.config'
require 'lsp.config.servers'
