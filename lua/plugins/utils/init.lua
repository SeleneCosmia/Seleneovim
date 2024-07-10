return {
    { require 'plugins.utils.folds' },
    { require 'plugins.utils.term_utils' },

    {
        'SuperBo/fugit2.nvim',
        cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2GRaph' },
        keys = {
            { '<leader>fg', mode = 'n', '<cmd>Fugit2<cr>' }
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim',
        },
        opts = {
            width = 80,
        }
    },

    { 'chrisgrieser/nvim-spider', lazy = true },

    {
        'LudoPinelli/comment-box.nvim',
        event = 'VeryLazy',
        opts = {}
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
        ft = { 'html', 'css', 'javascript', 'typescript', 'stylus' },
        cmd = { 'Npm', 'BrowserOpen', 'Npx', 'Pnpm' },
        config = function()
            require 'web-tools'.setup({})
        end
    },

    {
        'sustech-data/wildfire.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require 'wildfire'.setup()
        end
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
        version = 'v1.0.0',
        event = 'InsertEnter',
        opts = {}
    },

    {
        'lsvmello/elastictabstops.nvim',
        cmd = { 'ElasticTabstopsEnable', 'ElasticTabstopsDisable' },
        config = function()
            require 'elastictabstops'.setup()
        end
    },
    { 'b0o/SchemaStore.nvim', version = false },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
}
