local aucmd = vim.api.nvim_create_autocmd

aucmd({'BufRead','BufNewFile'}, {
    pattern = {'*.styl','*.stylus'},
    callback = function()
        vim.filetype.add {
            extension = {
                stylus = 'stylus',
                styl = 'stylus',
            },
        }
        vim.cmd.setfiletype 'stylus'
    end,
})
