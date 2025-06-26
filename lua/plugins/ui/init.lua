---@type LazySpec[]
return {
  { require 'plugins.ui.colors' },
  { require 'plugins.ui.bars' },
  { require 'plugins.ui.statusline' },
  { require 'plugins.ui.noice' },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    config = function()
      require 'config.ibl'
    end,
  },

  { 'MunifTanjim/nui.nvim', lazy = true },

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
