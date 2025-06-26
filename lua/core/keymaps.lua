local map = require 'utils.globals'.map
local modes = { 's', 'i', 'n', 'v' }
--════════════════════════════════════════════════════════════
map('<C-s>', '<Esc>:w<CR>', { desc = 'Exit insert mode & save changes.' }, modes)
map('<C>S', '<Esc>:wa<CR>', { desc = 'Exit insert mode & save all changes.' }, modes)

map('<leader>L', '<cmd>Lazy<CR>', { desc = 'Open Lazy float' })
map('<leader>mm', '<cmd>Mason<CR>', { desc = "Open Mason's floating window" })
map('<leader>nn', ':Neotree<cr>', { noremap = true })
--════════════════════════════════════════════════════════════
local ss = require 'smart-splits'

-- Resize buffers
map('<A-h>', ss.resize_left)
map('<A-j>', ss.resize_down)
map('<A-k>', ss.resize_up)
map('<A-l>', ss.resize_right)

-- Switch between buffers
map('<C-h>', ss.move_cursor_left)
map('<C-j>', ss.move_cursor_down)
map('<C-k>', ss.move_cursor_up)
map('<C-l>', ss.move_cursor_right)

-- Swap buffer positions
map('<leader><A-h>', ss.swap_buf_left)
map('<leader><A-j>', ss.swap_buf_down)
map('<leader><A-k>', ss.swap_buf_up)
map('<leader><A-l>', ss.swap_buf_right)
--════════════════════════════════════════════════════════════
map('<leader>df', function()
  vim.diagnostic.open_float({ scope = 'buffer' })
end, { noremap = true, silent = true })
--════════════════════════════════════════════════════════════
map('w', '<cmd>lua require "spider".motion("w")<CR>')
map('e', '<cmd>lua require "spider".motion("e")<CR>')
map('b', '<cmd>lua require "spider".motion("b")<CR>')

map('<C-f>', '<Esc>:= require "spider".motion("w")<CR>i', { silent = true }, 'i')
map('<C-b>', '<Esc>:= require "spider".motion("b")<CR>i', { silent = true }, 'i')
--════════════════════════════════════════════════════════════
