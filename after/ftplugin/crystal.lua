local api, bo = vim.api, vim.bo
local lsp = vim.lsp
local util = require 'lspconfig.util'

-- stylua: ignore start
bo.tabstop       = 2
bo.shiftwidth    = 2
bo.commentstring = '# %s'
-- stylua: ignore end
local capabilities = lsp.protocol.make_client_capabilities()

--[[
api.nvim_create_autocmd({'BufEnter','BufNewFile'}, {
    pattern = {'*.cr'},
    callback = function()

    end
})
]]
