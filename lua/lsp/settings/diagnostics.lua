---@diagnostic disable: unused-function,unused-local
local X = {}

X.setup = function()
  local icons = require 'utils.icons'.diagnostic_icons
  local signs = {
    { name = 'DiagnosticsSignError', text = icons.Error },
    { name = 'DiagnosticsSignWarn',  text = icons.Warn  },
    { name = 'DiagnosticsSignHint',  text = icons.Hint  },
    { name = 'DiagnosticsSignInfo',  text = icons.Info  }
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    on_attach_callback = nil,
    on_init_callback = nil,
    severity_sort = true,
    update_in_insert = false,
    underline = true,
    virtual_text = { spacing = 2 }
  }

  vim.diagnostic.config(config)
end

return X.setup()
