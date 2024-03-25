vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-----------------------------
local map = vim.keymap.set
local keymap = vim.api.nvim_create_user_command
local key = require 'utils.globals'.map
-----------------------------

keymap('Wq', 'wq', { bang = true, desc = 'Mistyped :wq cmd' })
keymap('W', 'w', { bang = true, desc = 'Mistyped :w cmd' })
keymap('Q', 'q', { bang = true, desc = 'Mistyped :q cmd' })
keymap('Wqa', 'wqa', { bang = true, desc = 'Mistyped :wqa cmd' })
keymap('Qa', 'qa', { bang = true, desc = 'Mistyped :qa cmd' })

--  ╔══════════════════════╗
--  ║ Smart-Splits Keymaps ║
--  ╚══════════════════════╝
--════════════════════════════════════════════════════════════
local ss = require('smart-splits')
-- ╭─────────────────╮
-- │ resizing splits │
-- ╰─────────────────╯
map('n', '<A-h>', ss.resize_left)
map('n', '<A-j>', ss.resize_down)
map('n', '<A-k>', ss.resize_up)
map('n', '<A-l>', ss.resize_right)
map('n', '10<C-Left>', ss.resize_left)
map('n', '10<C-Down>', ss.resize_down)
map('n', '10<C-Up>', ss.resize_up)
map('n', '10<C-Left>', ss.resize_right)
-- ╭────────────────────────────╮
-- │ move cursor between splits │
-- ╰────────────────────────────╯
map('n', '<C-h>', ss.move_cursor_left)
map('n', '<C-j>', ss.move_cursor_down)
map('n', '<C-k>', ss.move_cursor_up)
map('n', '<C-l>', ss.move_cursor_right)
-- ╭───────────────────────╮
-- │ swap buffer positions │
-- ╰───────────────────────╯
map('n', '<leader><A-h>', ss.swap_buf_left)
map('n', '<leader><A-j>', ss.swap_buf_down)
map('n', '<leader><A-k>', ss.swap_buf_up)
map('n', '<leader><A-l>', ss.swap_buf_right)
--════════════════════════════════════════════════════════════
-- stylua: ignore start
key('n', '<Leader>df', '<cmd>lua vim.diagnostic.open_float({scope = "buffer"})<CR>',
    { noremap = true, silent = true, desc = 'Open LSP diagnostics floating window' })
-- stylua: ignore end
--[[key({'n', 'i'}, 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    { noremap = true, silent = true, desc = 'Go to previous diagnostic' })

key({'n', 'i'}, 'g]', '<cmd>lua vim.diagnostic.goto_next()',
    { noremap = true, silent = true, desc = 'Go to next diagnostic' })]]
