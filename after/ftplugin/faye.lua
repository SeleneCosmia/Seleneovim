vim.cmd([[
  let b:undo_ftplugin = "setl formatoptions< iskeyword< lispwords< indentexpr< comments< commentstring<"
]])

vim.opt_local.formatoptions:remove { "t" }
vim.opt_local.formatoptions:append { "ro" }
vim.opt_local.iskeyword:append { "+,-,*,/,=,<,>" }
vim.opt_local.lispwords = "if,let,fn,lambda,󰘧"
vim.opt_local.indentexpr = "lispindent()"
vim.opt_local.comments = "n:;"
vim.opt_local.commentstring = ";%s"
