return {
  { require 'plugins.ui.colors' },
  { require 'plugins.ui.colorschemes' },
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

  { 'MunifTanjim/nui.nvim' },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'folke/snacks.nvim',
      'MunifTanjim/nui.nvim',
    },
    ---@module 'noice'
    ---@type NoiceConfig
    opts = {
      routes = {
        { filter = { event = 'notify', find = 'No information available' }, skip = true },
      },
      lsp = {
        signature = { enabled = false },
        hover = { enabled = true },
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = false,
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        lsp_doc_border = true,
      },
    },
  },

  {
    'tamton-aquib/flirt.nvim',
    event = 'VeryLazy',
    config = function()
      require 'flirt'.setup {
        close_command = 'Q',
        exclude_fts = {
          'notify',
          'noice',
          'snacks_notify',
          'cmp_menu',
          'blink_cmp_menu',
          'blink_cmp_docs',
          'lazy',
          'neo-tree-popup',
          'popup',
        },
      }
    end,
  },

  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      require 'config.appearance'.icon_colors()
    end,
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
