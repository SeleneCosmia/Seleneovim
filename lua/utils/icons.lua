local X = {}

X.kinds = {
  Array = '󰅨 ',
  Boolean = ' ',
  Color = ' ',
  Snippet = ' '
}

X.kind_icons = {
-- stylua: ignore start
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
-- stylua: ignore end
}

X.diagnostic_icons = {
  Error = '󰚌',
  Warn  = '',
  Hint  = '󰼈',
  Info  = '',
}

return X
