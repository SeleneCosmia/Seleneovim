return {
    {
        'rktjmp/lush.nvim',
        cmd = { 'Lushify' },
        dependencies = {
            'rktjmp/shipwright.nvim',
            cmd = { 'Shipwright' },
        },
    },

    { require 'plugins.colors.schemes' },

    {
        'uga-rosa/ccc.nvim',
        event = 'BufRead',
        config = function()
            local ccc = require 'ccc'
            ccc.setup({
                highlighter = {
                    auto_enable = true,
                },
            })
        end,
    },

    { 'zaldih/themery.nvim', enabled = false },
    { 'oleksiiluchnikov/gradient.nvim', enabled = false },
    { 'typicode/bg.nvim', lazy = false },
}
