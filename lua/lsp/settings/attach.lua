local methods = vim.lsp.protocol.Methods
local lsp, map = vim.lsp.buf, vim.keymap.set
local aucmd = vim.api.nvim_create_autocmd

local X = {}

--- glsl_analyzer startup error hotfix
--- ---
--- see: https://github.com/nolanderc/glsl_analyzer/issues/68#issuecomment-2316380963
local function glsl_cancel_request(client, request_id)
  -- Do nothing... fixes the issue 🤷
end

--- Implements lsp config automatically on lsp attach
---  ---
---```lua
---   map('n', 'gD', lsp.declaration, opts)
---   map('n', 'gd', lsp.definition, opts)
---   map({ 'n', 'i' }, '<C-z>', lsp.signature_help, opts)
---   map('n', 'K', lsp.hover, opts)
---   map('n', 'gi', lsp.implementation, opts)
---   map('n', 'gr', lsp.references, opts)
---
---   if client.supports_method(methods.textDocument_codeAction) then
---     map({ 'n', 'v' }, '<leader>ca', lsp.code_action, opts)
---   end
---
---   if client.name == 'glsl_analyzer' then
---     client.cancel_request = glsl_cancel_request
---   end
---```
function X.on_attach(client, bufnr)
  local opts = { buffer = bufnr }
-- ────────────────────────────────────── setup keymaps ──────────┨
  map('n', 'gD', lsp.declaration, opts)
  map('n', 'gd', lsp.definition, opts)
  map({ 'n', 'i' }, '<C-z>', lsp.signature_help, opts)
  map('n', 'K', lsp.hover, opts)
  map('n', 'gi', lsp.implementation, opts)
  map('n', 'gr', lsp.references, opts)

  if client.supports_method(methods.textDocument_codeAction) then
    map({ 'n', 'v' }, '<leader>ca', lsp.code_action, opts)
  end

  if client.name == 'glsl_analyzer' then
    client.cancel_request = glsl_cancel_request
  end

end

---@param client vim.lsp.Client
---@param bufnr integer
function X.format_on_attach(client, bufnr)
  map('n', '<leader>ff', function()
    local util = require 'vim.lsp.util'
    local params = util.make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, { buffer = bufnr })
end

return X
