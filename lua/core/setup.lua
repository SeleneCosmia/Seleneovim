local X = {}

X.lazy_setup = function()
    local lazy = require 'core.lazy'
    lazy.lazy_boot()
    lazy.lazy_setup()
    return lazy
end

X.opts = function()
    return require 'core.opts'
end

X.highlights = function()
    return require 'core.highlights'
end

return X
