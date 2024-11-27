local X = {}

function X.capabilities()
  return require 'lsp.settings.capabilities'.capabilities
end

function X.setup()
  return require 'lsp.settings.attach'
end

function X.diagnostic_opts()
  return require 'lsp.settings.diagnostics'
end

return X
