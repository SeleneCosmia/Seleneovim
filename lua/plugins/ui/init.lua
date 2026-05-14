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

  -- ╓─────────────────────────────────────────────────────────╖
  -- ║                  Highlighting Plugins                   ║
  -- ╙─────────────────────────────────────────────────────────╜
  { 'tzachar/highlight-undo.nvim', opts = {} },

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

  {
    'nvim-zh/colorful-winsep.nvim',
    branch = 'main',
    event = 'WinLeave',
  },
}
