local noice = require 'noice'
local opts = {}

---@type NoiceStatus
opts.status = {
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
}

opts.notify = {
  enabled = false,
}

opts.lsp = {
  override = {
    ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
    ['vim.lsp.util.stylize_markdown'] = false,
    ['cmp.entry.get_documentation'] = false,
  },
  signature = { enabled = false },
  hover = { enabled = false },
}
---@type NoiceConfigViews
opts.views = {
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
  cmdline_popup = {
    position = {
      row = 5,
      col = '50%',
    },
    size = {
      width = 60,
      height = 'auto',
    },
    win_options = {
      winhighlight = {
        Normal = 'NormalFloat',
        FloatTitle = 'Function',
      },
    },
    border = {
      style = 'single',
      padding = { 0, 1 },
    },
  },

  cmdline_popupmenu = {
    border = {
      style = 'single',
      padding = { 0, 1 },
    },
    position = 'auto',
    size = {
      width = 56,
      height = 12,
    },
    win_options = {
      winblend = 0,
      winhighlight = {
        Normal = 'NormalFloat',
        FloatBorder = 'Function',
      },
    },
    zindex = 500,
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
}
---@type NoiceRoute
opts.routes = {
  {
    filter = {
      event = 'lsp',
      kind = 'progress',
      find = 'Diagnosing',
    },
    opts = { skip = true },
  },
  {
    filter = {
      event = 'lsp',
      kind = 'progress',
      find = 'semantic',
    },
    opts = { skip = true },
  },
  {
    filter = {
      event = 'lsp',
      kind = 'progress',
      find = 'completion',
    },
    opts = { skip = true },
  },
}
