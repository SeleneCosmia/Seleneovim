local methods = vim.lsp.protocol.Methods
local lsp = vim.lsp.buf
local aucmd = vim.api.nvim_create_autocmd

local X = {}

--- glsl_analyzer startup error hotfix
--- ---
--- see: https://github.com/nolanderc/glsl_analyzer/issues/68#issuecomment-2316380963
---@param id? integer
-- local function glsl_cancel_request(id)
--   -- Do nothing... fixes the issue 🤷
-- end

--- Implements lsp config automatically on lsp attach
---@param client vim.lsp.Client
---@param bufnr integer
function X.on_attach(client, bufnr)
  ---@param lhs string
  ---@param rhs string|function
  ---@param desc? string
  ---@param mode? string|string[]
  local function map(lhs, rhs, desc, mode)
    mode = mode or 'n'
    desc = desc or nil
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  -- ────────────────────────────────────── setup keymaps ──────────┨
  map('[d', function()
    vim.diagnostic.jump { count = -1 }
  end, 'Jump to previous diagnostic')
  map(']d', function ()
    vim.diagnostic.jump { count = 1 }
  end, 'Jump to next diagnostic')

  if client:supports_method(methods.textDocument_definition) then
    map('gd', function()
      require 'snacks'.picker.lsp_definitions()
    end, 'Go to definition')
  end

  if client:supports_method(methods.textDocument_signatureHelp) then
    map('<C-z>', lsp.signature_help, 'Signature help', { 'n', 'i' })
  end

  map('K', lsp.hover)
  map('gi', lsp.implementation)
  map('gr', lsp.references)

  if client and client:supports_method(methods.textDocument_codeAction) then
    map('<leader>ca', lsp.code_action, 'Code Action', { 'n', 'v' })
  end
end

---@param client vim.lsp.Client
---@param bufnr integer
function X.format_on_attach(client, bufnr)
  local map = vim.keymap.set
  local format_params = vim.lsp.util.make_formatting_params({})

  map('n', '<leader>ff', function()
    client:request('textDocument/formatting', format_params, nil, bufnr)
  end, { buffer = bufnr })
end

return X
