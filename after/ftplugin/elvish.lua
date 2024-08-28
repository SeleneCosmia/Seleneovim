local bo, ol = vim.bo, vim.opt_local
local lsp = vim.lsp
local cmp, cmplsp = require 'cmp', require 'cmp_nvim_lsp'

bo.commentstring = '# %s'
ol.tabstop = 4
ol.shiftwidth = 4
ol.expandtab = true

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, cmplsp.default_capabilities())

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
