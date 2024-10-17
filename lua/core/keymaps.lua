vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-----------------------------
local map = vim.keymap.set
local keymap = vim.api.nvim_create_user_command
local key = require 'utils.globals'.map
-----------------------------
local modes = { 's', 'i', 'n', 'v' }
-----------------------------

keymap('Wq', 'wq', { bang = true, desc = 'Mistyped :wq cmd' })
keymap('W', 'w', { bang = true, desc = 'Mistyped :w cmd' })
keymap('Q', 'q', { bang = true, desc = 'Mistyped :q cmd' })
keymap('Wqa', 'wqa', { bang = true, desc = 'Mistyped :wqa cmd' })
keymap('Qa', 'qa', { bang = true, desc = 'Mistyped :qa cmd' })

--════════════════════════════════════════════════════════════
map('n', '<leader>lz', '<cmd>Lazy<CR>', { desc = 'Open Lazy float' })

map(modes, '<C-s>', '<Esc>:w<CR>', { desc = 'Exit insert mode & save changes.' })
map(modes, '<C>ss', '<Esc>:wa<CR>', { desc = 'Exit insert mode & save all changes.' })
--  ╔══════════════════════╗
--  ║ Smart-Splits Keymaps ║
--  ╚══════════════════════╝
--════════════════════════════════════════════════════════════
local ss = require 'smart-splits'

-- Resize buffers
map('n', '<A-h>', ss.resize_left)
map('n', '<A-j>', ss.resize_down)
map('n', '<A-k>', ss.resize_up)
map('n', '<A-l>', ss.resize_right)

-- Switch between buffers
map('n', '<C-h>', ss.move_cursor_left)
map('n', '<C-j>', ss.move_cursor_down)
map('n', '<C-k>', ss.move_cursor_up)
map('n', '<C-l>', ss.move_cursor_right)

-- Swap buffer positions
map('n', '<leader><A-h>', ss.swap_buf_left)
map('n', '<leader><A-j>', ss.swap_buf_down)
map('n', '<leader><A-k>', ss.swap_buf_up)
map('n', '<leader><A-l>', ss.swap_buf_right)
--════════════════════════════════════════════════════════════
-- stylua: ignore start
key('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float({scope = "buffer"})<CR>',
    { noremap = true, silent = true, desc = 'Open LSP diagnostics floating window' })
-- stylua: ignore end
--════════════════════════════════════════════════════════════
map('n', 'w', "<cmd>lua require 'spider'.motion('w')<CR>")
map('n', 'e', "<cmd>lua require 'spider'.motion('e')<CR>")
map('n', 'b', "<cmd>lua require 'spider'.motion('b')<CR>")

map('i', '<C-f>', "<Esc>l<cmd>lua require 'spider'.motion('w')<CR>i")
map('i', '<C-b>', "<Esc>l<cmd>lua require 'spider'.motion('b')<CR>i")
