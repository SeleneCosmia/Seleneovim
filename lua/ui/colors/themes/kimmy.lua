local kimbox = {}

---@param opts table
function kimbox.setup(opts)
    local kx = require 'kimbox'
    opts = {
        allow_italic = true,
        allow_undercurl = true,
        langs08 = true,
        style = 'zinnwaldite',
        toggle_style = {
            key = '<Leader>ts',
            bgs = {
                'burnt_coffee',     -- #231A0C
                'cannon',           -- #221A02
                'used_oil',         -- #221A0F
                'deep',             -- #0F111B
                'zinnwaldite',      -- #291804
                'eerie'             -- #1C0B28
            }
        }
    }
    return { kx.setup(opts) }
end

return kimbox
