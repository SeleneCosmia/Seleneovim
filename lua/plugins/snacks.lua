local icon = require 'utils.icons'

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      gitbrowse = {
        notify = false,
        url_patterns = {
          ['codeberg%.org'] = {
            branch = '/src/branch/{branch}',
            file = '/src/branch/{branch}/{file}#L{line_start}-L{line_end}',
            commit = '/commit/{commit}',
          }
        }
      },
      explorer = {},
      lazygit = { configure = true },
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
          'pdf'
        }
      },
      indent = { enabled = false },
      input = { enabled = true },
      notifier = {
        style = 'compact',
        enabled = true,
        timeout = 5000,
        icons = {
          error = icon.diagnostic_icons.Error,
        },
        filter = function(n)
          local title = {
            'Messages',
          }
          local message = {
            'No information available',
          }

          for _, v in ipairs(title) do
            if n.title == title[v] then
              return false
            end
          end

          for _, v in ipairs(message) do
            if n.msg == message[v] then
              return false
            end
          end

          return true
        end,
      },
      picker = {},
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
      words = {
        enabled = true,
        notify_end = false,
        debounce = 500,
      },
      styles = {
        snacks_image = {
          relative = 'editor',
          col = -1
        },
        notification = {
          wo = { wrap = true },
        },
      },

    },
    keys = {
      { '<leader>gg', function() require 'snacks'.lazygit() end, desc = 'Open lazygit' },
      {
        '<leader>N',
        desc = 'Neovim News',
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file('docs/news.txt', false)[1],
            width = 0.65,
            height = 0.75,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = 'yes',
              statuscolumn = '  ',
              conceallevel = 2,
            }
          })
        end,
      }
    },
  },
}

-- filter = function(notif)
--   local ignore = {
--     ['No information available'] = true,
--   }
--   return not ignore[notif.msg]
-- end,
