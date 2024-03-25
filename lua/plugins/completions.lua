return {
    { -- #TODO: decide on deleting this or not?,
        -- not really using this, but it also doesn't take up
        -- too much space so ‾\_(ツ)_/‾
        'onsails/lspkind.nvim',
        enabled = false,
        version = false,
    },
    --  ╭───────────────────────╮
    --  │ ~~ Autocompletions ~~ │
    --  ╰───────────────────────╯

    {
        'llllvvuu/nvim-cmp',
        version = false,
        branch = 'feat/above',
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'ray-x/cmp-treesitter' },
            { 'amarakon/nvim-cmp-fonts' },
            { 'bydlw98/cmp-env' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip', lazy = true },
        },
        config = function()
            require 'lsp.completions'
        end,
    },
    --  ╭─────────────────────╮
    --  │ ~~ Code Snippets ~~ │
    --  ╰─────────────────────╯

    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        version = 'v2.*',
        event = 'InsertEnter',
        dependencies = { 'rafamadriz/friendly-snippets', 'honza/vim-snippets' },
        config = function()
            local ls = require 'luasnip'
            local from_vscode = require 'luasnip.loaders.from_vscode'
            local from_snipmate = require 'luasnip.loaders.from_snipmate'

            local path_vscode = { vim.fn.stdpath('config') .. '/snippets/luasnip' }
            local path_snipmate = { vim.fn.stdpath('config') .. '/snippets/snipmate' }

            ls.setup({
                from_vscode.lazy_load(),
                from_snipmate.lazy_load(),
                from_vscode.lazy_load({ paths = path_vscode }),
                from_snipmate.lazy_load({ paths = path_snipmate }),
            })
        end,
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        dependencies = { 'llllvvuu/nvim-cmp' },
        config = function()
            local autopairs = require 'nvim-autopairs'
            local cmp_pairs = require 'nvim-autopairs.completion.cmp'

            require 'cmp'.event:on('confirm_done', cmp_pairs.on_confirm_done())
            autopairs.setup({
                close_triple_quotes = true,
                check_ts = true,
                fast_wrap = { map = '<C-e>' },
            })
        end,
    },

    {
        'chrisgrieser/nvim-scissors',
        cmd = { 'ScissorsAddNewSnippet', 'ScissorsEditSnippet' },
        dependencies = 'nvim-telescope/telescope.nvim',
        config = function()
            require 'scissors'.setup({
                snippetDir = vim.fn.stdpath('config') .. '/snippets/luasnip',
                editSnippetPopup = { border = 'rounded' },
                jsonFormatter = 'jq',
            })
        end,
    },

    -- ╭───────────────────╮
    -- │ ~~ Annotations ~~ │
    -- ╰───────────────────╯

    {
        'danymat/neogen',
        event = 'LspAttach',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'neogen'.setup { snippet_engine = 'luasnip' }
        end,
    },
}
