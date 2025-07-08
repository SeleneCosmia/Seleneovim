local map = require 'utils.globals'.map
local modes = { 's', 'i', 'n', 'v' }

map('U', '<c-r>', { desc = 'redo' })

-- Escape and save changes.
map('<C-s>', '<Esc>:w<CR>', { desc = 'Exit insert mode & save changes.' }, modes)
map('<C>S', '<Esc>:wa<CR>', { desc = 'Exit insert mode & save all changes.' }, modes)

-- Buffer navigation.
map('<C-l>', '<C-o>A', { desc = 'Jump to end of line' }, { 'i', 'c' })

map('<C-f>', '<Esc>l<cmd>lua require("spider").motion("w")<CR>i', { silent = true }, 'i')
map('<C-b>', '<Esc><cmd>lua require("spider").motion("b")<CR>i', { silent = true }, 'i')

map('w', '<cmd>lua require("spider").motion("w")<CR>')
map('e', '<cmd>lua require("spider").motion("e")<CR>')
map('b', '<cmd>lua require("spider").motion("b")<CR>')

-- Open plugin windows.
map('<leader>L', '<cmd>Lazy<CR>', { desc = 'Lazy' })
map('<leader>mm', '<cmd>Mason<CR>', { desc = 'Mason' })
map('<leader>nn', ':Neotree<cr>', { noremap = true })
--════════════════════════════════════════════════════════════
local ss = require 'smart-splits'

-- Resize buffers
map('<A-h>', ss.resize_left)
map('<A-j>', ss.resize_down)
map('<A-k>', ss.resize_up)
map('<A-l>', ss.resize_right)

-- Switch between buffers
map('<C-h>', ss.move_cursor_left, { desc = 'Move to the left window', remap = true })
map('<C-j>', ss.move_cursor_down, { desc = 'Move to the bottom window', remap = true })
map('<C-k>', ss.move_cursor_up, { desc = 'Move to the top window', remap = true })
map('<C-l>', ss.move_cursor_right, { desc = 'Move to the right window', remap = true })

-- Swap buffer positions
map('<leader><A-h>', ss.swap_buf_left)
map('<leader><A-j>', ss.swap_buf_down)
map('<leader><A-k>', ss.swap_buf_up)
map('<leader><A-l>', ss.swap_buf_right)
--════════════════════════════════════════════════════════════

-- Diagnostics.
map('<leader>df', function()
  vim.diagnostic.open_float({ scope = 'buffer' })
end, { noremap = true, silent = true })
