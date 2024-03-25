local aucmd = vim.api.nvim_create_autocmd

aucmd({'BufRead','BufNewFile'}, {
    pattern = { '*.kdl' },
    callback = function()
        vim.filetype.add {
            extension = { kdl = 'kdl' },
        }
        vim.cmd.setfiletype 'kdl'
    end,
})
