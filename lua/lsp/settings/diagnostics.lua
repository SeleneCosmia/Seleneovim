--# selene: allow(unused_variable)
---@diagnostic disable: unused-function,unused-local
local X = {}

---@param mode? string|table
---@param opts? table
local function keymap(mode, lhs, rhs, opts)
    mode = mode or 'n'
    if opts == nil then
        opts = { noremap = true, silent = true }
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

local sign_icons = {
    Error = "󰯆 ",
    Warn  = " ",
    Hint  = "󰛨 ",
    Info  = " "
}

function X.signs()
    for name, icon in pairs(sign_icons) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
end

local prefix_func = function(diagnostic)
    for d, icon in pairs(sign_icons) do
        if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
            return icon
        end
    end
end

function X.setup()
    return {
        vim.diagnostic.config({
            severity_sort = true,
            update_in_insert = false,
            virtual_text = {
                prefix = prefix_func(),
                spacing = 2
            },
        })
    }
end

--[[    keymap('n', '<leader>df', diagnostics.open_float)
        keymap('n', '<Alt>[', diagnostics.goto_prev)
        keymap('n', '<Alt>]', diagnostics.goto_next)
        keymap('n', '<leader><leader>l', diagnostics.setloclist)]]

return X
