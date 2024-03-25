local devdocs = require("nvim-devdocs")

devdocs.setup({
    telescope = {},
    float_win = {
        relative = "editor",
        height = 50,
        width = 100,
        border = "rounded",
    },
    previewer_cmd = "glow",
    cmd_args = { "-s", "dark", "-w", "75" },
    picker_cmd = true,
    picker_cmd_args = { "-p" },
    wrap = true,
})
