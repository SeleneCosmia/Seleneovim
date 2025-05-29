---@type LazySpec[]
return {
  { require 'plugins.ui.colors' },
  { require 'plugins.ui.bars' },
  { require 'plugins.ui.statusline' },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    config = function()
      require 'config.ibl'
    end,
  },

  { 'MunifTanjim/nui.nvim', lazy = true },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = { 'folke/snacks.nvim' },
    ---@module 'noice'
    ---@type NoiceConfig
    opts = {
      routes = {
        {
          filter = {
            event = 'notify',
            any = {
              { find = 'No information available' },
            },
          },
          opts = { skip = true},
        },
      },
      lsp = {
        signature = { enabled = true },
        hover = { enabled = true },
        documentation = {
          opts = {
            win_options = {
              concealcursor = 'n',
              conceallevel = 3,
              winhighlight = { Normal = 'LspFloat' },
            },
          },
        },
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        lsp_doc_border = true,
      },
    },
  },

  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      autoreload = true,
      cache = {
        enabled = true,
        path = vim.fn.stdpath('cache') .. '/devicon-auto-colors-cache.json',
      },
      precise_search = {
        enabled = true,
        iteration = 10,
        precision = 22,
        threshold = 24,
      }
    }
  },

  -- ╓─────────────────────────────────────────────────────────╖
  -- ║                  Highlighting Plugins                   ║
  -- ╙─────────────────────────────────────────────────────────╜
  { 'tzachar/highlight-undo.nvim', opts = {} },

  {
    'SeleneCosmia/rainbow-delimiters.nvim',
    config = function()
      local g = vim.g
      local rd = require 'rainbow-delimiters'

      g.rainbow_delimiters = {
        strategy = {
          [''] = rd.strategy['global'],
          vim = rd.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
        },
        priority = {
          [''] = 110,
        },
      }
    end,
  },

  {
    'nvimdev/hlsearch.nvim',
    event = 'BufRead',
    opts = {},
  },

  {
    'gen740/SmoothCursor.nvim',
    lazy = false,
    config = function()
      require 'config.appearance'.smooth_cursor()
    end,
  },

  {
    'svampkorg/moody.nvim',
    version = false,
    event = { 'ModeChanged', 'BufWinEnter', 'WinEnter' },
    opts = {
      disabled_filetypes = {
        'TelescopePrompt',
        'help',
      },
    },
  },
}
