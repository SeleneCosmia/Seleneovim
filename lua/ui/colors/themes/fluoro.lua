local fluoro = {}

---@param opts table
function fluoro.setup(opts)
    local fm = require 'fluoromachine'
    local overrides = {
        ['@function'] = { italic = true, bold = false },
        ['@boolean'] = { italic = true, bold = true },
    }
    opts = {
        glow = true,
        theme = 'delta',
        transparent = true,
        overrides = overrides
    }
    return { fm.setup(opts) }
end

return fluoro
