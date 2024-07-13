local aucmd = vim.api.nvim_create_autocmd

aucmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.cr' },
    callback = function()
        vim.filetype.add {
            extension = {
                cr = 'crystal'
            },
        }
        vim.cmd.setfiletype 'crystal'
    end,
})
