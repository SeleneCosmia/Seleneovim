--# selene: allow(unused_variable)
---@diagnostic disable: unused-function,unused-local
local X = {}

local sign_icons = {
  ERROR = '󰚌',
  WARN  = '',
  HINT  = '󰼈',
  INFO  = '',
}

local function prefixer(diagnostic)
  for d, icon in pairs(sign_icons) do
    if diagnostic.severity == vim.diagnostic.severity[d] then
      return icon
    end
  end
end

function X.setup()
  return {
    vim.diagnostic.config({
      severity_sort = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 2,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = sign_icons.ERROR,
          [vim.diagnostic.severity.WARN]  = sign_icons.WARN,
          [vim.diagnostic.severity.HINT]  = sign_icons.HINT,
          [vim.diagnostic.severity.INFO]  = sign_icons.INFO
        }
      }
    }),
  }
end

--[[    keymap('n', '<leader>df', diagnostics.open_float)
        keymap('n', '<Alt>[', diagnostics.goto_prev)
        keymap('n', '<Alt>]', diagnostics.goto_next)
        keymap('n', '<leader><leader>l', diagnostics.setloclist)]]

return X.setup()
