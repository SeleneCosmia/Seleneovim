local methods = vim.lsp.protocol.Methods
local lsp, map = vim.lsp.buf, vim.keymap.set
local aucmd = vim.api.nvim_create_autocmd

local X = {}

--- Sets up LSP keymaps/autocommands for lsp attached to the buffer
---@param client vim.lsp.Client
---@param bufnr integer
function X.on_attach(client, bufnr)
  local opts = { buffer = bufnr }
  local has_method = client.supports_method

  if has_method(methods.textDocument_declaration) then
    map('n', 'gD', lsp.declaration, opts)
  end
  if has_method(methods.textDocument_definition) then
    map('n', 'gd', lsp.definition, opts)
  end
  if has_method(methods.textDocument_codeAction) then
    map({ 'n', 'v' }, '<leader>ca', lsp.code_action, opts)
  end
  if has_method(methods.textDocument_signatureHelp) then
    map({ 'n', 'i' }, '<C-k>', lsp.signature_help, opts)
  end
  if has_method(methods.textDocument_hover) then
    map('n', 'K', lsp.hover, opts)
  end
  map('n', 'gi', lsp.implementation, opts)
  map('n', 'gr', lsp.references, opts)
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

aucmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  desc = 'Setup lsp functions',
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    X.on_attach(client, bufnr)
  end,
})

return X
