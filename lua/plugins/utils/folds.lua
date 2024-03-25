return {
    {
        'kevinhwang91/nvim-ufo',
        version = false,
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            local ufo = require 'ufo'
            ufo.setup({
                ---@diagnostic disable-next-line
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'treesitter', 'indent' }
                end,
            })
        end,
    },
}
