---@class config.lsp.diagnostics
local M = {}

function M.setup()
  local diagnostic_icons = require 'utils.icons'.diagnostic_icons
  local severity = vim.diagnostic.severity

  local icons = {
    [severity.ERROR] = diagnostic_icons.Error,
    [severity.WARN] = diagnostic_icons.Warn,
    [severity.INFO] = diagnostic_icons.Info,
    [severity.HINT] = diagnostic_icons.Hint
  }

  local config = {
    severity_sort = true,
    virtual_lines = false,
    virtual_text = false,
    update_in_insert = false,
    underline = false,
    signs = { text = icons },
    float = {
      source = 'if_many',
      border = 'single',
    },
  }

  return vim.diagnostic.config(config)
end

return M.setup()
