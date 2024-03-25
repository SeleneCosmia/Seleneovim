return {
    { 'tadmccorkle/markdown.nvim', ft = 'markdown', opts = {} },

    {
        'yaocccc/nvim-hl-mdcodeblock.lua',
        ft = 'markdown',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'hl-mdcodeblock'.setup {}
        end,
    },
}
