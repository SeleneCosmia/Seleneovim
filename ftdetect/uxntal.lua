local aucmd = vim.api.nvim_create_autocmd

aucmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.tal' },
    command = 'set filetype=uxntal',
})
