local methods = vim.lsp.protocol.Methods

local M = {}

---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
  local lsp = vim.lsp.buf
  ---@param lhs string
  ---@param rhs string|function
  ---@param desc string
  ---@param mode? string|string[]
  local function map(lhs, rhs, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map('K', lsp.hover, 'LSP Hover')
  map('gi', lsp.implementation, 'LSP Implementation')

  -- ──────────────────────────[ Diagnostic jumping keymaps ]───────────────────────
  map('[d', function()
    vim.diagnostic.jump { count = -1 }
  end, 'Jump to previous diagnostic')
  map(']d', function()
    vim.diagnostic.jump { count = 1 }
  end, 'Jump to next diagnostic')
  map('[e', function()
    vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
  end, 'Jump to previous error')
  map(']e', function()
    vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
  end, 'Jump to next error')
  -- ───────────────────────────────────────────────────────────────────────────────

  map('gr', function()
    require 'snacks'.picker.lsp_references()
  end, 'LSP References')

  if client:supports_method(methods.textDocument_codeAction) then
    map('<leader>ca', lsp.code_action, 'Code Actions', { 'n', 'x', 'v' })
  end

  if client:supports_method(methods.textDocument_signatureHelp) then
    map('<C-z>', function()
      lsp.signature_help()
    end, 'Signature Help', { 'n', 'i' })
  end

  if client:supports_method(methods.textDocument_definition) then
    map('gd', function()
      require 'snacks'.picker.lsp_definitions()
    end, 'Go to definition')
    map('gD', function()
      require 'snacks'.picker.lsp_definitions({ jump = { close = false } })
    end, 'Peek Definition')
  end
end

---Overriding LSP Markdown Config
--- ---
---Taken from: [MariaSolOs's config](https://github.com/MariaSolOs/dotfiles/blob/60d72faf606f9720456915713d3a7754db622ca7/.config/nvim/lua/lsp.lua#L206-L215)
---@param bufnr integer
---@param contents string[]
---@param opts table
---@return string[]
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
  contents = vim.lsp.util._normalize_markdown(contents, {
    width = vim.lsp.util._make_floating_popup_size(contents, { wrap = true }),
  })
  vim.bo[bufnr].filetype = 'markdown'
  vim.treesitter.start(bufnr)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

  return contents
end

local register_capability = vim.lsp.handlers[methods.client_registerCapability]
vim.lsp.handlers[methods.client_registerCapability] = function(err, res, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then
    return
  end

  on_attach(client, vim.api.nvim_get_current_buf())

  return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Configure LSP keymaps',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    on_attach(client, args.buf)
  end,
})

--- Setup the server passed to this function with optional
--- settings and default client capabilities (+ completions from blink.cmp)
---@param server string
---@param settings? table
function M.setup_server(server, settings)
  local capabilities = require 'lsp.settings.capabilities'.capabilities

  require('lspconfig')[server].setup(
    vim.tbl_deep_extend('error', { capabilities = capabilities, silent = true }, settings or {})
  )
end

return M
