local ls = require 'luasnip'
---@diagnostic disable-next-line: unused-local
local s, sn, isn =
  ls.snippet,
  ls.snippet_node,
  ls.indent_snippet_node
---@diagnostic disable-next-line: unused-local
local t, i, c, r, f =
  ls.text_node,
  ls.insert_node,
  ls.choice_node,
  ls.restore_node,
  ls.function_node
