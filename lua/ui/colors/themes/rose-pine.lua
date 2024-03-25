local rose = {}

function rose.setup(opts)
    local rp = require 'rose-pine'
    opts = {
        highlight_groups = {
            StatusLine = { fg = 'love' }
        }
    }
    return rp.setup(opts)
end

return rose
