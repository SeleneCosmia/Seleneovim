local noice = require 'noice'

return {
  ---@type NoiceConfig
  noice.setup({
    ---@type NoiceCmdline
    cmdline = {
      view = 'cmdline_popup',
      ---@type table<string, CmdlineFormat>
      format = {
        cmdline = {
          opts = {
            win_options = {
              winhighlight = { FloatBorder = 'DevIconJpegXl', FloatTitle = 'TSParameter' }
            }
          }
        },
        help = {
          icon = '󰺅 ', title = ' Help? ', icon_hl_group = 'LzFlag6',
          opts = {
            win_options = {
              winhighlight = { FloatBorder = 'LzFlag6', FloatTitle = 'LzFlag4' }
            }
          }
        },
        lua = {
          icon = ' ', title = ' Lua Cmd ', icon_hl_group = 'DevIconLua',
          opts = {
            win_options = {
              winhighlight = { FloatBorder = 'DevIconLua', FloatTitle = 'DevIconLuau' }
            }
          }
        },
        filter = {
          icon = ' ', title = ' Shell Cmd ', icon_hl_group = 'DevIconBash',
          opts = {
            win_options = {
              winhighlight = { FloatBorder = 'DevIconBash', FloatTitle = 'RainbowDelimiterGreen' }
            }
          }
        },
      },
    },
    lsp_progress = {
      format = {
        {
          '{progress} ',
          key = '',
          contents = {
              { '{data.progress.message} ' },
          },
        },
        { '{spinner} ', hl_group = 'LzFlag1' },
        { '{data.progress.title} ', hl_group = 'LzFlag3' },
        { '{data.progress.client} ', hl_group = 'LzFlag4' },
      },
    },
    lsp_progress_done = {
      { '  ', hl_group = 'LzFlag1' },
      { '{data.progress.title} ', hl_group = 'LzFlag3' },
      { '{data.progress.client} ', hl_group = 'LzFlag4' },
    },
    format = {
      spinner = { name = 'aesthetic' },
      progress = { width = 20 },
    },

    notify = {
      enabled = false,
    },

    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
        ['vim.lsp.util.stylize_markdown'] = false,
        ['cmp.entry.get_documentation'] = false,
      },
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      documentation = {
        view = 'hover',
        ---@type NoiceViewOptions
        opts = {
          lang = 'markdown',
          replace = true,
          render = 'plain',
          relative = 'cursor',
          anchor = 'auto',
          border = 'shadow',
          format = { '{message}' },
          win_options = {
            wrap = true,
            breakindent = true,
            conceallevel = 3,
          }
        }
      }
    },
      ---@type NoiceConfigViews
    views = {
      popup = {
        scrollbar = false,
        win_options = {
          winhighlight = {
            Normal = 'Normal',
            FloatBorder = 'LzFlag4',
          },
        },
      },
--╞═════════ commandline options ═════════════════════════════════════════════════╡
      cmdline = {
        win_options = {
          winhighlight = { Normal = 'Normal' },
        },
      },

      cmdline_popup = {
        position = {
          row = '40%',
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
        win_options = {
          winhighlight = {
            Normal = 'Normal',
            FloatTitle = 'Function',
          },
        },
      },

      popupmenu = {
        border = {
          style = 'single',
          padding = { 0, 1 },
        },
        -- relative = 'editor',
        position = {
          row = '52%',
          col = '50%',
        },
        size = {
          width = 57,
          height = 10,
        },
        win_options = {
          winblend = 0,
          winhighlight = {
            Normal = 'Normal',
            FloatBorder = 'Function',
          },
        },
      },
--  ╞══════════════════════════════════════════════════════════════════════════════════╡
      mini = {
        border = { style = 'rounded' },
        reverse = false,
        win_options = {
          winblend = 30,
          winhighlight = {
            Normal = 'Normal',
          },
        },
      },
--  ╞══════════════════════════════════════════════════════════════════════════════════╡
      split = { enter = true },
      virtualtext = { hl_group = 'NonText' },
    },
        ---@type NoiceRoute
    routes = {
      {
        filter = {
          event = 'lsp',
          kind = 'progress',
          find = 'Diagnosing',
        },
        opts = { skip = true },
      }, {
        filter = {
          event = 'lsp',
          kind = 'progress',
          find = 'semantic',
        },
        opts = { skip = true },
      }, {
        filter = {
          event = 'lsp',
          kind = 'progress',
          find = 'completion',
        },
        opts = { skip = true },
      },
    },
  }),
}
