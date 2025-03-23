---@type LazySpec[]
return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    build = 'cargo +nightly build --release',
    enabled = true,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'bydlw98/blink-cmp-env',
      'disrupted/blink-cmp-conventional-commits',
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
        ['<C-e>']     = { 'cancel', 'fallback' },
        ['<C-y>']     = { 'select_and_accept', 'fallback' },
        ['<CR>']      = { 'accept', 'fallback' },

        ['<Tab>'] = {
          function(cmp)
            local ls = require 'luasnip'
            if cmp.is_menu_visible() then
              return cmp.select_next()
            elseif ls.locally_jumpable(1) then
              return cmp.snippet_forward()
            end
          end,
          'fallback'
        },
        ['<S-Tab>'] = {
          function(cmp)
            local ls = require 'luasnip'
            if cmp.is_menu_visible() then
              return cmp.select_prev()
            elseif ( ls.in_snippet() and ls.jumpable(-1) ) then
              return cmp.snippet_backward()
            end
          end,
          'fallback'
        },

        ['<C-p>']     = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>']     = { 'select_next', 'fallback_to_mappings' },

        -- ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
        -- ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },

        ['<C-Down>']  = {
          function(cmp)
            if cmp.is_documentation_visible() then
              return cmp.scroll_documentation_down()
            end
          end,
          'fallback'
        },
        ['<C-Up>']    = {
          function(cmp)
            if cmp.is_documentation_visible() then
              return cmp.scroll_documentation_up()
            end
          end,
          'fallback'
        },
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
          border = 'rounded',
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
              --
              --   highlight = function(ctx)
              --     local s = ctx.source_name
              --
              --     local str = {}
              --     str.start = string.sub(s, 1, 1)
              --     str.end = string.sub(s, -1, -1)
              --     str.name = string.sub(s, 2, -2)
              --
              --     local highlights = {}
              --     for _, 
              --
              --     return highlights
              --   end,
              -- },
              ---@type blink.cmp.DrawComponent
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
          treesitter_highlighting = true,
          auto_show = true,
          auto_show_delay_ms = 100,
          update_delay_ms = 85,
          window = {
            max_height = math.floor(vim.api.nvim_win_get_height(0) / 3),
            border = 'rounded'
          },
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
        default = function()
          local sources = { 'conventional_commits', 'lazydev', 'lsp', 'buffer', 'env', 'css_vars' }
          local ok, node = pcall(vim.treesitter.get_node)

          if ok and node then
            if not vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
              table.insert(sources, 'path')
            end
            if node:type() ~= 'string' then
              table.insert(sources, 'snippets')
            end
          end

          return sources
        end,
        -- { 'conventional_commits', 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'env', 'css_vars' },
        providers = {
          conventional_commits = {
            name = 'conventional commits',
            module = 'blink-cmp-conventional-commits',
            enabled = function()
              return vim.bo.filetype == 'gitcommit'
            end,
          },
          css_vars = {
            name = 'CSS',
            module = 'css-vars.blink',
            enabled = function()
              return vim.bo.filetype == ('css' or 'sass' or 'scss' or 'sugarss')
            end,
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
            name = 'BUF',
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
              show_braces = false,
              show_documentation_window = true,
            },
          },
          lazydev = {
            name = 'LAZY',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
            fallbacks = { 'lsp' }
          },
        },
      },
    },
  },

  {
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
    opts = {
      snippetDir = vim.fn.stdpath 'config' .. '/snippets/luasnip',
      editSnippetPopup = { border = 'rounded' },
      jsonFormatter = 'jq',
    },
  },

  {
    'danymat/neogen',
    event = 'LspAttach',
    opts = { snippet_engine = 'luasnip' },
  },
}
