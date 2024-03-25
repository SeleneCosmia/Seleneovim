return {
    { "nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
-- ╭──────────────────────────────────────────────────────────╮
-- │                      󰋒  config 󰋒                         │
-- ╰──────────────────────────────────────────────────────────╯
    config = function()
    local map = require "utils.globals".map
    local tree = require "neo-tree"
    tree.setup({
        default_component_configs = {
            indent = {}
        },
        window = {
            position = "left",
            width = 25,
            mapping_options = {
                noremap = true,
                nowait = false,
            },
            mappings = {
                ["S"] = "open_vsplit",
                ["s"] = "open_split",
                ["P"] = { "toggle_preview", config = { use_float = true }},
            },
        },
        filesystem = {
            follow_current_file = { enabled = true },
            group_empty_dirs = true,
            hijack_netrw_behavior = "open_default",
            use_libuv_file_watcher = true,
            filtered_items = {
                hide_dotfiles = false,
                hide_by_name = {
                    "package-lock.json"
                },
                always_show = {
                    ".gitignore",
                    ".luarc.json",
                    ".neoconf.json"
                },
        }}})
    map("n", "<leader>nn", ":Neotree<cr>", {noremap = true})
end
}}
