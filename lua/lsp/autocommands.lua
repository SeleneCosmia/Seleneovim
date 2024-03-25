local methods = vim.lsp.protocol.Methods
local map = vim.keymap.set
local aucmd = vim.api.nvim_create_autocmd

local X = {}

--- Sets up LSP keymaps/autocommands for lsp attached to the buffer
---@param client lsp.Client
---@param bufnr integer
function X.on_attach(client, bufnr)
    local opts = { buffer = bufnr }
    if client.supports_method(methods.textDocument_declaration) then
        map('n', 'gD', vim.lsp.buf.declaration, opts)
    end
    if client.supports_method(methods.textDocument_definition) then
        map('n', 'gd', vim.lsp.buf.definition, opts)
    end
    if client.supports_method(methods.textDocument_codeAction) then
        map({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
    end
    if client.supports_method(methods.textDocument_signatureHelp) then
        map({'n','i'}, '<C-;>', vim.lsp.buf.signature_help, opts)
    end
    if client.supports_method(methods.textDocument_hover) then
        map('n', 'K', vim.lsp.buf.hover, opts)
    end
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
end

---@param client lsp.Client
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
        local bufnr  = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then
            return
        end

        X.on_attach(client, bufnr)
    end,
})

return X
