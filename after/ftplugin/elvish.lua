local bo = vim.bo
local lsp = vim.lsp
local cmp = require 'cmp'
local cmp_lsp = require 'cmp_nvim_lsp'

bo.commentstring = '# %s'
bo.tabstop = 4
bo.shiftwidth = 4
bo.expandtab = true

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, cmp_lsp.default_capabilities())

lsp.start({
    name = 'elvish_ls',
    cmd = { 'elvish', '-lsp' },
    capabilities = capabilities,
})


--[[vim.api.nvim_create_autocmd({'BufEnter','BufNewFile'}, {
    pattern = {'*.elv'},
    callback = function()
        vim.cmd  ':lua vim.lsp.s '
    end
})]]
