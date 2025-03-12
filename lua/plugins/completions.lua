return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    build = 'cargo +nightly build --release',
    enabled = true,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'bydlw98/blink-cmp-env',
      'jdrupal-dev/css-vars.nvim',
      { 'xzbdmw/colorful-menu.nvim', opts = {} },
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

        ['<Tab>'] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_next()
            elseif cmp.snippet_active() then
              return cmp.snippet_forward()
            end
          end,
          'fallback'
        },
        ['<S-Tab>'] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_prev()
            elseif cmp.snippet_active() then
              return cmp.snippet_backward()
            end
          end,
          'fallback'
        },
        ['<C-p>']     = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>']     = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>']     = { 'show_signature', 'hide_signature', 'fallback' },
      },
      -- stylua: ignore end
      signature = { enabled = false },
      fuzzy = {
        sorts = {
          'exact',
          'score',
          'sort_text',
          'kind',
        },
      },
      completion = {
        trigger = {
          show_in_snippet = false,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          auto_show = true,
          enabled = true,
          scrollbar = false,
          border = 'single',
          draw = {
            align_to = 'label',
            columns = {
              { 'kind_icon' },
              { 'label', gap = 2 },
              { 'kind' },
            },
            components = {
              -- source_name = {
              --   text = function(ctx)
              --     ctx.source_name = '' .. ctx.item.source_name .. ''
              --     return ctx.source_name
              --   end,
                -- highlight = function(ctx)
                --   local name = ctx.source_name
                --
                -- end,
              -- },
              label = {
                width = { fill = true, max = 60, min = 25 },
                text = function(ctx)
                  return require 'colorful-menu'.blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require 'colorful-menu'.blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
        documentation = {
          treesitter_highlighting = false,
          auto_show = true,
          auto_show_delay_ms = 300,
          update_delay_ms = 50,
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'normal',
      },
      snippets = {
        preset = 'luasnip',
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'env' },
        per_filetype = {
          css = { 'lsp', 'css_vars', 'snippets', 'path', 'buffer' },
        },
        providers = {
          css_vars = {
            name = 'CSS',
            module = 'css-vars.blink',
            opts = {
              search_extensions = { '.js', '.ts', '.jsx', '.tsx' },
            },
          },
          lsp = {
            name = 'LSP',
            score_offset = 90,
          },
          path = {
            name = 'PATH',
            score_offset = 25,
            opts = {
              show_hidden_files_by_default = true,
              trailing_slash = false,
            },
          },
          snippets = {
            name = 'SNIP',
            min_keyword_length = 2,
            score_offset = 85,
            max_items = 8,
          },
          buffer = {
            name = 'BUFF',
            min_keyword_length = 3,
            max_items = 4,
            score_offset = 15,
          },
          env = {
            name = '$ENV',
            module = 'blink-cmp-env',
            max_items = 8,
            score_offset = 20,
            should_show_items = function()
              local cursor = vim.api.nvim_win_get_cursor(0)[2]
              local line = vim.api.nvim_get_current_line()

              if string.sub(line, cursor, cursor + 1) == '$' then
                return true
              else
                return false
              end
            end,
            opts = {
              -- item_kind = require 'blink.cmp.types'.CompletionItemKind.Variable,
              show_braces = false,
              show_documentation_window = true,
            },
          },
          lazydev = {
            name = 'LAZY',
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
