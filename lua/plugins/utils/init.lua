return {
    { require 'plugins.utils.folds' },
    { require 'plugins.utils.md_utils' },
    { require 'plugins.utils.term_utils' },

    {
        'LudoPinelli/comment-box.nvim',
        event = 'VeryLazy',
        opts = {}
    },

    {
        'luckasRanarison/nvim-devdocs',
        cmd = {
            'DevdocsFetch',
            'DevdocsKeywordprg',
            'DevdocsOpen',
            'DevdocsOpenCurrent',
            'DevdocsOpenCurrentFloat',
            'DevdocsOpenFloat',
            'DevdocsInstall',
            'DevdocsToggle',
            'DevdocsUpdate',
            'DevdocsUpdateAll'
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require 'plugins.utils.devdocs'
        end,
    },

    { 'numToStr/Comment.nvim', opts = {} },

    {
        'Cassin01/wf.nvim',
        version = false,
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require 'wf'.setup()
        end,
    },

    {
        'ray-x/web-tools.nvim',
        lazy = true,
        cmd = { 'BrowserSync', 'BrowserOpen' },
        config = function()
            require 'web-tools'.setup({
                keymaps = {
                    rename = nil,
                    repeat_rename = '.',
                },
            })
        end,
    },

    {
        'sustech-data/wildfire.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require 'wildfire'.setup()
        end,
    },

    {
        'utilyre/sentiment.nvim',
        version = false,
        event = 'BufReadPost',
        opts = {},
        init = function()
            vim.g.loaded_matchparen = 1
        end,
    },

    {
        'mrjones2014/smart-splits.nvim',
        version = false,
        event = 'BufEnter',
        config = function()
            require 'core.keymaps'
        end,
        opts = {
            { ignored_buftypes = { 'neo-tree' } },
            { resize_mode = { silent = true } },
        },
    },

    {
        'jghauser/follow-md-links.nvim',
        lazy = true,
        ft = { 'md', 'markdown' },
        config = function()
            vim.keymap.set('n', '<BS>', ':edit #<CR>', { silent = true })
        end,
    },

    {
        'lambdalisue/suda.vim',
        lazy = true,
        cmd = { 'SudaWrite', 'SudaRead' },
        keys = {
            { '<leader>sw', '<cmd>SudaWrite<cr>', { desc = 'does a sudo write on keypress' }}
        },
        config = function()
            vim.g.suda_smart_edit = 1
        end,
    },

    {
        'max397574/better-escape.nvim',
        event = 'InsertEnter',
        config = function()
            require 'better_escape'.setup()
        end,
    },

    { 'b0o/SchemaStore.nvim', version = false },

    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'MunifTanjim/nui.nvim', lazy = true },

    -- Disabled plugins

    {
        'OscarCreator/rsync.nvim',
        enabled = false,
        build = 'make',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require 'rsync'.setup()
        end,
    },
}
