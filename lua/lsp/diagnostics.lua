local X = {}

local sign_icons = { Error = '󰯆 ', Warn = ' ', Hint = '󰛨 ', Info = ' ' }

X.setup = function(opts)
  for name, icon in pairs(sign_icons) do
    name = 'DiagnosticSign' .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
  end

  if type(opts.diagnostics.virtual_text) == 'table' and opts.diagnostics.virtual_text.prefix == 'icons' then
    opts.diagnostics.virtual_text.prefix = function(diagnostic)
      for d, icon in pairs(sign_icons) do
        if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
          return icon
        end
      end
    end
  end
  opts.diagnostics.virtual_text.spacing = 2

  vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
end

return X
