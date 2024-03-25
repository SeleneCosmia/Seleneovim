local aucmd = vim.api.nvim_create_autocmd

aucmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.cr' },
    command = 'setfiletype crystal',
})
