--  ╭─────────────────────────────────────────────────────────╮
--  │                       LSP config                        │
--  ╰─────────────────────────────────────────────────────────╯
---@class Seleneovim.lsp.config
local M = {}
local methods = vim.lsp.protocol.Methods

---A callback executed when LSP engine attaches to a buffer.
---@type fun(client: vim.lsp.Client, bufnr: integer)
local on_attach = function(client, bufnr)
  local lsp = vim.lsp.buf

  ---@type fun(lhs: string, rhs: string|fun(), desc: string, mode?: string|string[])
  local function map(lhs, rhs, desc, mode)
    local opts = { noremap = true, buffer = bufnr, desc = desc }
    mode = mode or 'n'

    return vim.keymap.set(mode, lhs, rhs, opts)
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
    map('<leader>ca', function()
      require 'actions-preview'.code_actions()
    end, 'Code Action Preview', { 'n', 'v' })
    map('<C-a>', function()
      lsp.code_action()
    end, 'Code Actions', 'i')
    -- map('<leader>ca', lsp.code_action(), 'Code Action', { 'n', 'v' })
  end

  -- if client:supports_method(methods.textDocument_inlayHint) then
  --   local InlayHintsGroup = vim.api.nvim_create_augroup('toggle_inlay_hints', { clear = false })
  --
  --   vim.defer_fn(function()
  --     local mode = vim.api.nvim_get_mode().mode
  --     vim.lsp.inlay_hint.enable(mode == 'n' or mode == 'v', { bufnr = bufnr })
  --   end, 500)

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
---@type fun(bufnr: integer, contents: string[], opts: table): string[]
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
  opts = vim.tbl_deep_extend('force', opts, { wrap = true })
  contents = vim.lsp.util._normalize_markdown(contents, {
    width = vim.lsp.util._make_floating_popup_size(contents, opts),
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

local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover {
    border = vim.o.winborder or 'rounded',
    wrap = true,
    wrap_at = math.floor(vim.o.columns * 0.5 - 1),
    max_height = math.floor(vim.o.lines * 0.5),
    max_width = math.floor(vim.o.columns * 0.5),
  }
end

local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
  return signature_help {
    border = vim.o.winborder or 'rounded',
    max_height = math.floor(vim.o.lines * 0.4),
    max_width = math.floor(vim.o.columns * 0.4),
  }
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('Seleneovim.lsp.config', { clear = false }),
  desc = 'Lsp config initilization',
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
  local capabilities = require 'lsp.capabilities'.make_capabilities()

  require('lspconfig')[server].setup(
    vim.tbl_deep_extend('error', {
      capabilities = capabilities,
      on_attach = on_attach,
      silent = true
    }, settings or {})
  )
end

return M
