local aucmd = vim.api.nvim_create_autocmd

aucmd({ 'BufNewFile', 'BufRead' }, {
    pattern = { '*.fy', '*.faye' },
    callback = function()
        vim.filetype.add {
            extension = {
                fy = 'faye',
                faye = 'faye',
            },
        }
        vim.cmd.setfiletype 'faye'
    end,
})
