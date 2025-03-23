---@diagnostic disable:lowercase-global
local icon = require 'utils.icons'

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      lazygit = { configure = true },
      indent = { enabled = false },
      input = { enabled = true },
      image = {
        enabled = true,
        doc = {
          inline = false,
          max_width = 45,
          max_height = 20,
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
        timeout = 5000,
        sort = { 'added', 'level' },
        icons = {
          error = icon.diagnostic_icons.Error,
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = false },
      scroll = { enabled = false },
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
        wo = {
          spell = false,
          wrap = true,
        },
      },
      words = {
        enabled = true,
        notify_end = false,
        debounce = 500,
      },
      styles = {
        snacks_image = {
          relative = 'editor',
          col = -1,
        },
        notification = {
          wo = { wrap = true },
        },
      },
    },
    keys = {
      {
        '<leader>lg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Open lazygit',
      },
      {
        '<leader>km',
        function()
          Snacks.picker.highlights()
        end,
        desc = 'Keymaps picker',
      },
      {
        '<leader>H',
        function()
          Snacks.picker.highlights()
        end,
        desc = 'Highlights picker',
      },
      {
        '<leader>C',
        function()
          Snacks.picker.colorschemes()
        end,
        desc = 'Colorschemes picker',
      },
      {
        '<leader>N',
        desc = 'Neovim News',
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
            width = 0.6,
            height = 0.8,
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
    },
  },
}
