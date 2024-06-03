local map = require 'utils.globals'.map
local tree = require 'neo-tree'
return {
    tree.setup({
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
    }),
    map('n', '<leader>nn', ':Neotree<cr>', { noremap = true }),
}
