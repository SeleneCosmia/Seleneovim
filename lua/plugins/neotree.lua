---@type LazySpec[]
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    event = 'VeryLazy',
    version = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim',
    },
    opts = {
      default_component_configs = {
        indent = {
          last_indent_marker = '╰',
        },
      },
      modified = { symbol = ' ' },
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
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        group_empty_dirs = true,
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
        filtered_items = {
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
        },
      },
    },
  },
}
