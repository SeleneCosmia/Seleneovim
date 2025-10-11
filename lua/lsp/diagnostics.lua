local icons = require 'utils.icons'.diagnostic_icons

vim.diagnostic.config({
  severity_sort = true,
  virtual_lines = false,
  virtual_text = false,
  update_in_insert = false,
  underline = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.Error,
      [vim.diagnostic.severity.WARN] = icons.Warn,
      [vim.diagnostic.severity.INFO] = icons.Info,
      [vim.diagnostic.severity.HINT] = icons.Hint,
    },
  },
  float = {
    source = true,
    border = 'solid',
  },
})
