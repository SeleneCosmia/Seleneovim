return {
  {
    'saghen/blink.cmp',
    build = 'cargo +nightly build --release',
    lazy = false,
    enabled = true,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'bydlw98/blink-cmp-env',
      'jdrupal-dev/css-vars.nvim',
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = { enabled = false },
      -- stylua: ignore start
      keymap = {
        preset = 'none',

        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<ESC>']     = { 'hide', 'fallback' },
        ['<C-y>']     = { 'select_and_accept', 'fallback' },
        ['<CR>']      = { 'accept', 'fallback' },

        ['<Tab>']     = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>']   = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-p>']     = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>']     = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>']     = { 'show_signature', 'hide_signature', 'fallback' },
      },
      -- stylua: ignore end
      signature = { enabled = false },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          auto_show = true,
          -- enabled = true,
          border = 'rounded',
          draw = {
            align_to = 'label',
            columns = {
              { 'source_name' },
              { 'label', 'label_description', gap = 2 },
              { 'kind_icon' },
            },
          },
        },
        -- documentation = {
        --   auto_show = true,
        --   auto_show_delay_ms = 500,
        -- },
        trigger = {
          -- prefetch_on_insert = true,
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'normal',
      },
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'env' },
        providers = {
          css_vars = {
            name = 'CSS',
            module = 'css-vars.blink',
            opts = {
              search_extensions = { '.js', '.ts', '.jsx', '.tsx' },
            },
          },
          lsp = {
            name = 'lsp',
            score_offset = 10,
            fallbacks = { 'buffer' },
          },
          path = {
            name = ' ',
            score_offset = -1,
            fallbacks = { 'env', 'buffer' },
            opts = {
              show_hidden_files_by_default = true,
            },
          },
          snippets = {
            name = ' ',
            min_keyword_length = 2,
            score_offset = 1,
          },
          buffer = {
            name = '󰔨 ',
            max_items = 4,
            min_keyword_length = 3,
            score_offset = -3,
          },
          env = {
            name = ' ',
            module = 'blink-cmp-env',
            max_items = 4,
            score_offset = -2,
          },
          lazydev = {
            name = ' ',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },
    },
  },

  {
    --    'hrsh7th/nvim-cmp',
    'iguanacucumber/magazine.nvim',
    event = { 'InsertEnter *' },
    cond = vim.g.completion_plugin == 'cmp',
    name = 'nvim-cmp',
    version = false,
    dependencies = {
      { 'iguanacucumber/mag-nvim-lsp', name = 'cmp-nvim-lsp', opts = {} },
      { 'iguanacucumber/mag-buffer', name = 'cmp-buffer' },
      { url = 'https://codeberg.org/FelipeLema/cmp-async-path.git' },
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
    opts = {},
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
