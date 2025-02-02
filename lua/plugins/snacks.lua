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
      lazygit = { configure = true },
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
      picker = { enabled = true },
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
        notification = {
          wo = { wrap = true },
        },
      },

    },
    keys = {
      { '<leader>gg', function() require 'snacks'.lazygit() end, desc = 'Open lazygit' },
    }
  },
}

-- filter = function(notif)
--   local ignore = {
--     ['No information available'] = true,
--   }
--   return not ignore[notif.msg]
-- end,
