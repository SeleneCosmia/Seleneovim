return {
    { 'Biscuit-Colorscheme/nvim', name = 'biscuit' },
    { 'nyoom-engineering/oxocarbon.nvim', lazy = true },

    {
        'ray-x/starry.nvim',
        config = function()
            local opts = {
                italics = {
                    functions = true,
                    variables = true,
                }
            }
            require 'starry'.setup(opts)
        end,
    },

    { 'rose-pine/neovim', lazy = false },

    {
        'luisiacc/gruvbox-baby',
        config = function()
            require 'ui.colors'.gruvbox()
        end,
    },

    {
        'lmburns/kimbox',
        config = function()
            require 'ui.colors'.kimbox()
        end,
    },

    {
        'craftzdog/solarized-osaka.nvim',
        priority = 10000,
        lazy = false,
        config = function()
            local osaka = require 'plugins.colors.config.osaka'
            osaka.setup{}
            vim.cmd.colorscheme 'solarized-osaka-storm'
        end
    },

    {
        'rockerBOO/boo-colorscheme-nvim',
        config = function()
            local boo = require 'boo-colorscheme'
            boo.setup({ italic = true })
        end,
    },
}
