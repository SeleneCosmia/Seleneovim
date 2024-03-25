vim.api.nvim_create_autocmd({'BufNewFile','BufRead'}, {
    pattern = '*.elv',
    callback = function()
        vim.filetype.add({
            extension = {
                elv = 'elvish',
            },
        })
        vim.cmd.setfiletype 'elvish'
    end,
})
