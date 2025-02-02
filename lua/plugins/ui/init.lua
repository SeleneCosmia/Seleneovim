return {
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

  {
    'rcarriga/nvim-notify',
    enabled = false,
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
      'MunifTanjim/nui.nvim'
    },
    opts = function(_, opts)
      opts.routes = opts.routes or {}

      table.insert(opts.routes, {
        filter = {
          event = 'notify',
          find = 'No information available',
        },
        opts = { skip = true },
      })

      local focused = true
      vim.api.nvim_create_autocmd('FocusGained', {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd('FocusLost', {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          ['not'] = {
            event = 'lsp',
            kind = 'progress',
          },
          cond = function()
            return not focused and false
          end,
        },
        view = 'notify_send',
        opts = { stop = false, replace = true },
      })

      -- opts.lsp = {
      --   override = {
      --     ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      --     ['vim.lsp.util.stylize_markdown'] = true,
      --     ['cmp.entry.get_documentation'] = true,
      --   },
      --   signature = {enabled = false},
      -- }
      -- opts.notify = {
      --   enabled = false,
      -- }
      opts.presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function(event)
          vim.schedule(function()
            require 'noice.text.markdown'.keys(event.buf)
          end)
        end,
      })
      return opts
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
    'luukvbaal/statuscol.nvim',
    enabled = false,
    lazy = false,
    opts = function()
      require 'config.appearance'.statuscolumn()
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
      }
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
