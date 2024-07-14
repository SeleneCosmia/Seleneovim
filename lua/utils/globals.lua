local X = {}
local fmt = string.format

--- Create a custom keymapping
---@param mode? string|table what mode this command will work in ('n' or 'normal' is the default)
---@param lhs string "left-hand-side"
---                 - the <key sequence> that executes the {rhs} function
---@param rhs string|function a lua or vimscript function to execute on {lhs} keypress
---@param opts? table<string, any> a table of |:map-options|
function X.map(mode, lhs, rhs, opts)
    mode = mode or 'n'
    if mode == nil then
        mode = 'n'
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

--- Define a new |highlight| group or redefine an existing group.
---@param ns_id? number The `namespace` to apply highlighting to.
---@param name string the highlight group's name, see `:Telescope highlights` for names
---@param val vim.api.keyset.highlight -> A {table} of options, see `:h highlight` for more info
function X.hl(ns_id, name, val)
    ns_id = ns_id or 0
    if ns_id == nil then
        ns_id = 0
    end
    vim.api.nvim_set_hl(ns_id, name, val)
end


X.ts_parsers = {
    'awk',
    'bash',
    'css',
    'crystal', -- Custom parser
    'elvish',
    'fish',
    'gitignore',
    'glsl',
    'go',
    'html',
    'http',
    'hyprlang',
    'julia',
    'lua',
    'markdown',
    'markdown_inline',
    'mermaid',
    'query',
    'rasi',
    'regex',
    'rust',
    'scss',
    'toml',
    'uxntal',
    'vim',
    'vimdoc',
    'wgsl',
    'xml',
    'yaml',
    'yuck',
    'zig'
}

X.kind_icons = {
-- stylua: ignore start
        Text            = ' ',
        Method          = '󰆧 ',
        Function        = '󰊕 ',
        Constructor     = '󱌣 ',
        Field           = '󰈚 ',
        Variable        = '󱍶 ',
        Class           = '󰠱 ',
        Interface       = ' ',
        Module          = ' ',
        Property        = '󰜢 ',
        Unit            = '󰑭 ',
        Value           = '󰎠 ',
        Enum            = ' ',
        Keyword         = '󰌋 ',
        Snippet         = ' ',
        Color           = '󱥚 ',
        File            = '󰈙 ',
        Reference       = '󰈇 ',
        Folder          = '󱃪 ',
        EnumMember      = ' ',
        Constant        = '󰏿 ',
        Struct          = '󰙅 ',
        Event           = ' ',
        Operator        = '󰆕 ',
        TypeParameter   = ' ',
-- stylua: ignore end
}

X.detective = {
    'bash',
    'hyprlang',
    'zathurarc',
    'css',
    'scss',
    'xml',
    'markdown',
    'markdown_inline',
    'lua',
    'awk',
    'regex',
}

---@param str string? the string to apply truncation to
---@param len number  the max length in which to render `string`
---@return string?
function X.truncate_menu(str, len)
    
end

return X
