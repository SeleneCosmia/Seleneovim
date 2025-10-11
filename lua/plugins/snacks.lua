---@diagnostic disable:lowercase-global
local icon = require 'utils.icons'

---@type LazySpec[]
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
    --> ── enabled components ──────────────────────────────────────────────
      animate = { fps = 240 },
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      lazygit = { configure = true },
      input = { enabled = true },
      image = {
        enabled = true,
        doc = {
          enabled = true,
          float = false,
          inline = false,
          max_width = 200,
          max_height = 100,
        },
        formats = {
          'png',
          'jpg',
          'jpeg',
          'jxl',
          'gif',
          'bmp',
          'webp',
          'tiff',
          'heic',
          'avif',
          'mp4',
          'mov',
          'avi',
          'mkv',
          'webm',
          'pdf',
        },
      },
      gitbrowse = {
        notify = false,
        url_patterns = {
          ['codeberg%.org'] = {
            branch = '/src/branch/{branch}',
            file = '/src/branch/{branch}/{file}#L{line_start}-L{line_end}',
            commit = '/commit/{commit}',
          },
        },
      },
      picker = {
        enabled = true,
        ui_select = true,
      },
      notifier = {
        enabled = true,
        style = 'fancy',
        filter = function(n)
          local ignores = {
            '^No information available$',
            '^client.supports_method is deprecated',
            '^client.notify is deprecated'
          }
          return not vim.iter(ignores):any(
            ---@param notif string
            function(notif)
              return string.find(n.msg, notif) ~= nil
            end
          )
        end,
      },
      quickfile = { enabled = true },
      statuscolumn = {
        enabled = true,
        left = { 'mark', 'sign' },
        right = { 'fold' },
        folds = {
          open = true,
        },
      },
      terminal = {
        win = {
          position = 'float',
          border = 'shadow',
        },
      },
      win = {
        resize = true,
        wo = { spell = false },
      },
      words = {
        enabled = true,
        notify_end = false,
        debounce = 500,
      },

    --> ── disabled components ─────────────────────────────────────────────
      indent = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },

-- ╾────────────────────────────────────────────────────────────────────╼
      styles = {
        snacks_image = {
          relative = 'editor',
          col = -1,
        },
        notification = {
          wo = { wrap = true },
          relative = 'editor',
        },
        notification_history = {
          width = 0.8,
          wo = { wrap = true },
        },
      },
    },
    keys = {
      -- stylua: ignore start
      { '<leader>lg', function() Snacks.lazygit() end, desc = 'Open lazygit' },
      { '<leader>km', function() Snacks.picker.keymaps() end, desc = 'Keymaps picker' },
      { '<leader>H', function() Snacks.picker.highlights() end, desc = 'Highlights picker' },
      { '<leader>C', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes picker' },
      { '<C-i>', function() Snacks.image.hover() end, desc = 'View image' },
      { '<leader>i', function() Snacks.image.hover() end, desc = 'View image' },
      { '<leader>nx', function() Snacks.notifier.hide() end, desc = 'Dismiss notifications' },
      { '<leader>nh', function() Snacks.notifier.show_history() end, desc = 'Display notification history' },
      { '<leader>nd', function() Snacks.notifier.hide() end, desc = 'Dismiss notifications' },
      -- stylua: ignore end
      {
        '<leader>N',
        desc = 'Neovim News',
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
            width = 0.8,
            height = 0.8,
            border = 'single',
            wo = {
              spell = false,
              wrap = false,
              signcolumn = 'yes',
              statuscolumn = '  ',
              conceallevel = 3,
            },
          })
        end,
      },
    },
  },
}
