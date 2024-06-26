local X = {}

function X.Capabilities()
    return require 'lsp.settings.capabilities'.client_capabilities()
end

function X.setup()
    return require 'lsp.settings.attach'
end

function X.diagnostic_opts()
    local diagnostics = require 'lsp.diagnostics'
    diagnostics.setup()
    return diagnostics
end

return X
