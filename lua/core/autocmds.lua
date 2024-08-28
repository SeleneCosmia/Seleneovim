local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map     = vim.keymap.set

local HLY = augroup('YankHighlight', { clear = true })
--  ╾──────────────────────────────────────────────────────────╼

autocmd('TextYankPost', {
  group = HLY,
  callback = function()
    vim.highlight.on_yank({ timeout = 2000, priority = 1000 })
  end,
})

autocmd('FileType', {
  group = augroup('QToQuit', { clear = true }),
  pattern = {
    'help',
    'notify',
    'tsplayground',
    'checkhealth',
    'lspinfo',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    map('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

autocmd('VimResized', {
  group = augroup('SplitResize', { clear = true }),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})
