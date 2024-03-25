local hl = vim.api.nvim_set_hl
local cw = require("codewindow")
local keybinds = cw.apply_default_keybinds

local get_width = vim.api.nvim_win_get_width
local get_height = vim.api.nvim_win_get_height

local disabled = {
    auto_enable = false,
    minimap_width = 16,
    window_border = "rounded",
    exclue_filetypes = {"help","lazy","mason","noice","neo-tree","cmp_menu"}
}

local enabled = {
    auto_enable = true,
    minimap_width = 16,
    window_border = "rounded",
    exclue_filetypes = {"help","lazy","mason","noice","neo-tree","cmp_menu"}
}

local function setup_highlights()
    return {
    hl(0, "CodewindowBackground", { link = 'Normal', blend = 5 }),
    hl(0, 'CodewindowBoundsBackground', { link = 'CursorLine', blend = 5 }),
    hl(0, "CodewindowBorder", { link = '@function',bold = true }),
    }
end

return {
    vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, {
        pattern = '*',
        once = false,
        callback = function(opts)
            if get_width(0) <= 112 or get_height(0) <= 18  then
                opts = disabled
                return {
                    cw.setup(opts),
                    keybinds(),
                    setup_highlights()
                }
            elseif get_width(0) >= 113 or get_height(0) >= 19 then
                opts = enabled
                return {
                    cw.setup(opts),
                    keybinds(),
                    setup_highlights()
                }
            end
        end
    }),
}
