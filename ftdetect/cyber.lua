local aucmd = vim.api.nvim_create_autocmd

aucmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.cyber', '*.cy', '*.cyon', '*.cys' },
    callback = function()
        vim.filetype.add {
            extension = {
                cyber = 'cyber',
                cyon = 'cyber',
                cys = 'cyber',
                cy = 'cyber',
            },
        }
        vim.cmd.setfiletype 'cyber'
    end,
})
