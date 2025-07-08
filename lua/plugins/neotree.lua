---@type LazySpec[]
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    lazy = false,
    version = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      'folke/snacks.nvim',
    },
    ---@module 'neo-tree'
    ---@type neotree.Config?
    opts = {
      sources = {
        'filesystem',
        'buffers',
        'document_symbols',
        'git_status',
      },
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = 'filesystem' },
          { source = 'buffers' },
          { source = 'document_symbols' },
          { source = 'git_status' }
        },
        content_layout = 'center',
        tabs_layout = 'equal',
        padding = 1,
        show_separator_on_edge = true,
      },
      default_component_configs = {
        indent = {
          padding = 0,
          last_indent_marker = '╰',
        },
        modified = {
          symbol = ' ',
        },
      },
      window = {
        position = 'left',
        width = 25,
        mapping_options = {
          noremap = true,
          nowait = false,
        },
        mappings = {
          ['S'] = 'open_vsplit',
          ['s'] = 'open_split',
          ['P'] = {
            'toggle_preview',
            config = {
              use_float = true,
              use_snacks_image = true
            }
          },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        group_empty_dirs = true,
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_gitignored = false,
          hide_dotfiles = false,
          hide_by_name = {
            'package-lock.json',
            '.directory',
          },
          always_show = {
            '.gitignore',
            '.luarc.json',
            '.neoconf.json',
          },
          never_show = {
            '.directory',
          },
        },
      },
    },
  },
}
