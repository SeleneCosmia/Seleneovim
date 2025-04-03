local set = vim.opt_local
local lsp = vim.lsp

vim.bo.commentstring = '# %s'
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true

local capabilities = lsp.protocol.make_client_capabilities()

lsp.start({
    name = 'Elvish Language Server',
    cmd = { 'elvish', '-lsp' },
    capabilities = require 'blink-cmp'.get_lsp_capabilities(capabilities)
})

--[[vim.api.nvim_create_autocmd({'BufEnter','BufNewFile'}, {
    pattern = {'*.elv'},
    callback = function()
        vim.cmd  ':lua vim.lsp.s '
    end
})]]
