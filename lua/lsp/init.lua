local X = {}

function X.Capabilities()
  return require 'lsp.settings.capabilities'
end

function X.setup()
  return require 'lsp.settings.attach'
end

function X.diagnostic_opts()
  return require 'lsp.settings.diagnostics'
end

return X
