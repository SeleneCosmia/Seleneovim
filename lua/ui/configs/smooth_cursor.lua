local Smooth = {}
local smoothcursor = require "smoothcursor"

function Smooth.config()
  smoothcursor.setup({
    type = 'exp',
    fancy = {
        enable = true,
        head = { cursor = '❥ ', texthl = 'SmoothCursor', linehl = nil },
        body = {
            { cursor = ' ', texthl = '@ibl.scope.char.1' },
            { cursor = '🟏 ', texthl = '@ibl.indent.char.6' },
            { cursor = ' ', texthl = '@ibl.indent.char.5' },
            { cursor = '☿ ', texthl = '@ibl.indent.char.4' },
            { cursor = '⚸ ', texthl = '@ibl.indent.char.3' },
            { cursor = '✴ ', texthl = '@ibl.indent.char.2' },
            { cursor = ' ', texthl = '@ibl.indent.char.1' },
        },
        tail = { cursor = nil, texthl = 'SmoothCursor' }
    }})
end

return Smooth
