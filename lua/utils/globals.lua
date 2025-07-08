local M = {}

---Create a new user-defined keymapping
---@param lhs string Keymap body
---@param rhs string|fun() function to execute on keypress
---@param opts? vim.keymap.set.Opts a table of `map-options`
---@param mode? string|string[]
function M.map(lhs, rhs, opts, mode)
  mode = mode or 'n'
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

---Defines a new `highlight` group or overwrite an existing group.
---@param ns_id? number The `namespace` to apply highlighting to.
---   Defaults to `0` for global namespace
---@param name string The name of the highlight group.
---@param val vim.api.keyset.highlight A {table} of options to apply to the hl group
---   see: `:h highlight` for more info.
function M.hl(ns_id, name, val)
  ns_id = ns_id or 0
  vim.api.nvim_set_hl(ns_id, name, val)
end

M.ts_parsers = {
  'awk',
  'bash',
  'css',
  'elvish',
  'fish',
  'gitignore',
  'glsl',
  'go',
  'html',
  'http',
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
  'zig',
}

M.filetypes = {
  web_dev = {
    'gleam',
    'html',
    'css',
    'postcss',
    'sass',
    'scss',
    'stylus',
    'sugarss',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
}

return M
