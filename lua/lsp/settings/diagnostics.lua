local X = {}

X.setup = function()
  local icons = require 'utils.icons'.diagnostic_icons
  local severity = vim.diagnostic.severity

  ---@type vim.diagnostic.Opts
  local config = {
    virtual_lines = true,
    virtual_text = { current_line = true },
    on_attach_callback = nil,
    on_init_callback = nil,
    severity_sort = true,
    update_in_insert = false,
    underline = false,
    signs = {
      text = {
        [severity.ERROR] = icons.Error,
        [severity.WARN]  = icons.Warn,
        [severity.INFO]  = icons.Info,
        [severity.HINT]  = icons.Hint
      },
    },
    -- virtual_text = false
  }

  return vim.diagnostic.config(config)
end

return X.setup()
