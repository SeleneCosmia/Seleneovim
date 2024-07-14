return {
    {
        'freddiehaddad/feline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local feline = require 'feline'
            feline.setup()
        end,
        init = function()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'LazyCheck',
                callback = function()
                    vim.opt.statusline = vim.opt.statusline
                end,
            })
        end,
    },
}
