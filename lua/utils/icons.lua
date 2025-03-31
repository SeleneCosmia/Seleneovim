local M = {}

-- stylua: ignore start
M.kind_icons = {
  Array           = '󰅨 ',
  Boolean         = ' ',
  Class           = '󰠱 ',
  Color           = ' ',
  Constant        = ' ',
  Constructor     = '󱌣 ',
  Text            = ' ',
  Method          = '󰆧 ',
  Function        = '󰊕 ',
  Field           = '󰈚 ',
  Variable        = '󱍶 ',
  Interface       = ' ',
  Module          = ' ',
  Property        = '󰜢 ',
  Unit            = '󰑭 ',
  Value           = '󰎠 ',
  Enum            = ' ',
  Keyword         = '󰌋 ',
  Snippet         = ' ',
  File            = '󰈙 ',
  Reference       = '󰈇 ',
  Folder          = '󱃪 ',
  EnumMember      = ' ',
  Struct          = '󰙅 ',
  Event           = ' ',
  Operator        = ' ',
  TypeParameter   = ' ',
}

M.diagnostic_icons = {
  Error = '󰚌',
  Warn  = '',
  Hint  = '󰼈',
  Info  = '',
}
-- stylua: ignore end

return M
