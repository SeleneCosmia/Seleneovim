local noice = require 'noice'

return {
    ---@type NoiceConfig
  noice.setup({
        ---@type NoiceCmdline
    cmdline = {
      view = 'cmdline_popup',
        format = {
          cmdline = {
            opts = {
              win_options = {
                winhighlight = {
                  FloatBorder = 'DevIconJpegXl', FloatTitle = 'TSParameter'
                }
              }
            }
          },
        help = {
          icon = ' 󰺅 ̫', title = ' Help? ', icon_hl_group = 'LzFlag6',
          opts = {
            win_options = {
              winhighlight = {
                FloatBorder = 'LzFlag6', FloatTitle = 'LzFlag4'
              },
            },
          },
        },
        lua = {
          icon = ' ̫', title = ' Lua Cmd ', icon_hl_group = 'DevIconLua',
            opts = {
              win_options = {
                winhighlight = {
                  FloatBorder = 'DevIconLua', FloatTitle = 'DevIconLuau'
                },
              },
            },
          },
        filter = {
          icon = '', title = ' Shell Cmd ', icon_hl_group = 'DevIconBash',
            opts = {
              win_options = {
                winhighlight = {
                  FloatBorder = 'DevIconBash', FloatTitle = 'RainbowDelimiterGreen',
                },
              },
            },
          },
        },
      },

      notify = {
          enabled = true,
          view = 'notify',
        },
        lsp = {
            hover = {
                enabled = false,
                ---@type NoiceViewOptions
                opts = {
                    win_options = {
                        wrap = true,
                        linebreak = true,
                    },
                },
            },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true,
            },
            documentation = {
                view = 'hover',
                ---@type NoiceViewOptions
                opts = {
                    lang = 'markdown',
                    replace = true,
                    render = 'plain',
                    format = { '{message}' },
                    win_options = {
                        breakindent = true,
                        concealcursor = 'n',
                        conceallevel = 3,
                        wrap = true,
                    },
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
        ---@type NoiceFormatOptions
        format = {
            ---@type NoiceFormatOptions.spinner
            spinner = {
                name = 'aesthetic',
            },
            ---@type NoiceFormatOptions.progress
            progress = {
                width = 20,
            },
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
                    winhighlight = {
                        Normal = 'Normal',
                    },
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
                    style = 'rounded',
                    padding = { 0, 1 },
                },
                relative = 'editor',
                position = {
                    row = '58%',
                    col = '50%',
                },
                size = {
                    width = 60,
                    height = 12,
                },
                win_options = {
                    winblend = 0,
                    winhighlight = {
                        Normal = 'Normal',
                        FloatBorder = 'Function',
                        PmenuMatch = 'PmenuSel',
                    },
                },
            },
--  ╞══════════════════════════════════════════════════════════════════════════════════╡
            mini = {
                border = {
                    style = 'rounded',
                },
                reverse = false,
                win_options = {
                    winblend = 30,
                    winhighlight = {
                        Normal = 'Normal',
                    },
                },
            },
--  ╞═════════ lsp hover-docs options ═════════════════════════════════════════════════╡
            hover = {
                border = {
                    style = 'single',
                    padding = { 0, 1 },
                },
                win_options = {
                    wrap = true,
                    linebreak = true,
                },
            },
--  ╞══════════════════════════════════════════════════════════════════════════════════╡
            notify = {
                replace = true,
            },

            split = {
                enter = true,
            },

            virtualtext = {
                hl_group = 'NonText',
            },
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

--[[{    @type NoiceFilter
                filter = {
                    event = 'msg_show',
                    find = 'Nekifoch',
                    cmdline = true,
                    ["not"] = { find = 'Whichkey functionality is disabled.' }
                },
                -- @type NoiceRouteOptions|NoiceViewOptions
                opts = { skip = true },
            },]]
