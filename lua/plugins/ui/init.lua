return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    config = function()
      require 'config.ibl'
    end,
  },

  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require 'config.notify'
    end,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require 'config.noice'
    end,
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
          'cmp_menu',
          'lazy',
          'neo-tree-popup',
          'popup',
        },
      }
    end,
  },

  {
    'willothy/nvim-cokeline',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },

  {
    'luukvbaal/statuscol.nvim',
--    lazy = false,
    event = 'UIEnter',
    opts = function()
      require 'config.statuscolumn'
    end,
  },

  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      require 'config.devicons'
    end,
  },

-- ╓─────────────────────────────────────────────────────────╖
-- ║                  Highlighting Plugins                   ║
-- ╙─────────────────────────────────────────────────────────╜
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
    event = 'BufEnter',
    config = function()
      require 'config.smooth_cursor'.config()
    end,
  },

  { 'tzachar/highlight-undo.nvim', opts = {} },

  {
    'svampkorg/moody.nvim',
    event = { 'ModeChanged', 'BufWinEnter', 'WinEnter' },
    opts = {
      disabled_filetypes = { 'TelescopePrompt' }
    }
  },

  --{{{ {
  --   'mvllow/modes.nvim',
  --   event = 'ModeChanged',
  --   enabled = false,
  --   config = function()
  --     require 'modes'.setup({
  --       ignore_filetypes = {
  --         'neo-tree',
  --         'TelescopePrompt',
  --         'notify',
  --         'lazy',
  --         'cmp_menu',
  --         'help',
  --         'lspinfo',
  --         'mason'
  --       },
  --     })
  --   end,
  -- }}}--,
}
