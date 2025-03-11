local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map     = vim.keymap.set
local on_attach = require 'lsp.settings.attach'.on_attach

local relnum_group = augroup('ToggleRelNums', {})
autocmd({ 'BufEnter', 'FocusGained', 'WinEnter' }, {
  group = relnum_group,
  desc = 'Toggle relative line numbers on',
  callback = function()
    if vim.wo.nu then
      vim.wo.rnu = true
    end
  end,
})

autocmd({ 'BufLeave', 'FocusLost', 'WinLeave' }, {
  group = relnum_group,
  desc = 'Toggle relative line numbers off',
  callback = function()
    if vim.wo.nu then
      vim.wo.rnu = false
    end
  end
})

autocmd('FileType', {
  group = augroup('QToQuit', { clear = true }),
  pattern = {
    'checkhealth',
    'help',
    'lspinfo',
    'nofile',
    'notify',
    'man',
    'qf',
    'query',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    map('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  desc = 'Setup lsp functions/keymaps',
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    on_attach(client, bufnr)
  end,
})

autocmd('TextYankPost', {
  group = augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.hl.on_yank({ timeout = 2000, priority = 1000 })
  end,
})

autocmd('VimResized', {
  group = augroup('ResizeSplits', { clear = true }),
  pattern = '*',
  callback = function()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. vim.fn.tabpagenr())
  end,
  desc = 'Resize buffers when nvim is resized.'
})
