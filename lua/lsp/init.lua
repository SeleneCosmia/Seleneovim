local X = {}

function X.Capabilities()
    return require 'lsp.settings.capabilities'
end

function X.setup()
    return require 'lsp.settings.attach'
end

function X.diagnostic_opts()
    local diagnostics = require 'lsp.diagnostics'
    return diagnostics.setup()
end

return X
