local blink_ext = { 'lazydev', 'conventional_commits', 'html-css', 'css_vars' }
local blink_defaults = vim.list_extend({ 'lsp', 'path', 'snippets', 'buffer', 'env' }, blink_ext)

---@type LazySpec[]
return {
  {
    'saghen/blink.compat',
    version = '2.*',
    lazy = true,
    opts = {},
  },

  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    -- build = 'cargo build --release',
    enabled = true,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'bydlw98/blink-cmp-env',
      'disrupted/blink-cmp-conventional-commits',
      'jdrupal-dev/css-vars.nvim',
      { 'xzbdmw/colorful-menu.nvim', opts = {} },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = { enabled = false },
      snippets = {
        preset = 'luasnip',
        expand = function(snippet)
          require 'luasnip'.lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require 'luasnip'.jumpable(filter.direction)
          end
          ---@diagnostic disable-next-line:return-type-mismatch
          return require 'luasnip'.in_snippet()
        end,
        jump = function(direction)
          require 'luasnip'.jump(direction)
        end,
      },
      -- stylua: ignore start
      keymap = {
        preset = 'none',

        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<ESC>']     = { 'cancel', 'fallback' },
        ['<C-e>']     = { 'hide', 'fallback' },
        ['<C-y>']     = { 'select_and_accept', 'fallback' },
        ['<C-p>']     = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>']     = { 'select_next', 'fallback_to_mappings' },
        ['<CR>']      = { 'accept', 'fallback' },
        ['<Tab>']     = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>']   = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-Down>']  = {
          function(cmp)
            if cmp.is_documentation_visible() then
              return cmp.scroll_documentation_down(1)
            end
          end,
          'fallback'
        },
        ['<C-Up>'] = {
          function(cmp)
            if cmp.is_documentation_visible() then
              return cmp.scroll_documentation_up(1)
            end
          end,
          'fallback'
        },
      },
      -- stylua: ignore end
      fuzzy = {
        implementation = 'prefer_rust',
        sorts = {
          'exact',
          'score',
          'sort_text',
          'kind',
        },
      },
      signature = {
        enabled = true,
        window = {
          border = 'bold',
        },
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        ghost_text = { enabled = true },
        menu = {
          auto_show = true,
          enabled = true,
          scrollbar = false,
          border = 'rounded',
          draw = {
            treesitter = { 'lsp' },
            align_to = 'label',
            padding = 2,
            gap = 1,
            columns = {
              { 'kind_icon' },
              { 'label', gap = 2 },
              { 'kind' },
              { 'source_name' },
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
          auto_show = true,
          auto_show_delay_ms = 10,
          treesitter_highlighting = true,
          window = {
            max_height = math.floor(vim.o.columns * 0.5),
            border = 'rounded',
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'normal',
      },
      sources = {
        default = blink_defaults,
        providers = {
          conventional_commits = {
            name = 'Commit',
            module = 'blink-cmp-conventional-commits',
            enabled = function()
              return vim.bo.filetype == 'gitcommit'
            end,
          },
          css_vars = {
            name = 'CSS',
            module = 'css-vars.blink',
            enabled = function()
              local stylesheets = { 'css', 'sass', 'scss', 'stylus', 'sugarss' }
              local ft = vim.iter(stylesheets):any(function(v)
                return vim.bo.filetype == v
              end)
              return ft
            end,
            opts = {
              search_extensions = { '.js', '.ts', '.jsx', '.tsx' },
            },
          },
          ['html-css'] = {
            name = 'html-css',
            module = 'blink.compat.source',
          },
          lsp = {
            name = 'lsp',
            enabled = true,
            module = 'blink.cmp.sources.lsp',
          },
          path = {
            name = 'Path',
            module = 'blink.cmp.sources.path',
            score_offset = 3,
            opts = {
              show_hidden_files_by_default = true,
              trailing_slash = false,
            },
          },
          snippets = {
            name = 'Snippet',
            enabled = true,
            max_items = 8,
            min_keyword_length = 2,
            module = 'blink.cmp.sources.snippets',
            score_offset = -3,
            opts = {
              show_autosnippets = true,
            },
          },
          buffer = {
            name = 'Buffer',
            score_offset = -10,
          },
          env = {
            name = '$ENV',
            module = 'blink-cmp-env',
            max_items = 8,
            score_offset = 3,
            should_show_items = function()
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before = vim.api.nvim_get_current_line():sub(1, col)
              return before:match('%$') ~= nil
            end,
            opts = {
              show_braces = false,
              show_documentation_window = true,
            },
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
            fallbacks = { 'lsp' },
          },
        },
      },
    },
  },

  {
    'Jezda1337/nvim-html-css',
    dependencies = { 'saghen/blink.cmp', 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
}
