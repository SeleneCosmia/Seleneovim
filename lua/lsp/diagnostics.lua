local X = {}

local sign_icons = { Error = '󰚌', Warn = '', Hint = '󱠂', Info = '' }

function X.setup(opts)
  opts.diagnostics.signs.text = {
    [vim.diagnostic.severity.ERROR] = sign_icons.Error,
    [vim.diagnostic.severity.WARN]  = sign_icons.Warn,
    [vim.diagnostic.severity.HINT]  = sign_icons.Hint,
    [vim.diagnostic.severity.INFO]  = sign_icons.Info
  }

  if type(opts.diagnostics.virtual_text) == 'table' and opts.diagnostics.virtual_text.prefix == 'icons' then
    opts.diagnostics.virtual_text.prefix = function(diagnostic)
      for d, icon in pairs(sign_icons) do
        if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
          return icon
        end
      end
    end
  end
  opts.diagnostics.virtual_text.spacing = 1

  vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
end

return X
