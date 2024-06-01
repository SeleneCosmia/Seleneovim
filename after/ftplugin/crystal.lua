local api, bo = vim.api, vim.bo
local lsp = vim.lsp
local util = require 'lspconfig.util'

bo.tabstop       = 4
bo.shiftwidth    = 4
bo.commentstring = "# %s"

local capabilities = lsp.protocol.make_client_capabilities()

--[[
api.nvim_create_autocmd({'BufEnter','BufNewFile'}, {
    pattern = {'*.cr'},
    callback = function()
        
    end
})
]]
