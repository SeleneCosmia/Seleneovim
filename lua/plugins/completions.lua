return {
  {
    'onsails/lspkind.nvim',
    enabled = false,
    version = false,
  },

  {
--    'hrsh7th/nvim-cmp',
    'iguanacucumber/magazine.nvim',
    name = 'nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'bydlw98/cmp-env',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require 'lsp.completions'
    end,
  },

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
        keep_roots = true,
        update_events = { 'TextChanged', 'TextChangedI' },

        delete_check_events = 'TextChanged',
        enable_autosnippets = true,
      })

      from_vscode.lazy_load()
      from_snipmate.lazy_load()
      from_vscode.lazy_load({ paths = path_vscode })
      from_snipmate.lazy_load({ paths = path_snipmate })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
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
      require 'scissors'.setup {
        snippetDir = vim.fn.stdpath 'config' .. '/snippets/luasnip',
        editSnippetPopup = { border = 'rounded' },
        jsonFormatter = 'jq',
      }
    end,
  },

  {
    'danymat/neogen',
    event = 'LspAttach',
    config = function()
      require 'neogen'.setup { snippet_engine = 'luasnip' }
    end,
  },
}
