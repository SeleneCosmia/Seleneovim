local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map     = vim.keymap.set

autocmd('TextYankPost', {
  group = augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.hl.on_yank({ timeout = 2000, priority = 1000 })
  end,
})

autocmd('FileType', {
  group = augroup('QToQuit', { clear = true }),
  pattern = {
    'help',
    'checkhealth',
    'lspinfo',
    'nofile',
    'notify',
    'qf',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    map('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})
