local hl = require 'utils.globals'.hl
local X = {}

local highlights = {
    ModesCopy   = '#f5c359',
    ModesDelete = '#c75c6a',
    ModesInsert = '#78ccc5',
    ModesVisual = '#9745be'
}

X.highlighter = function()
   for modes, colors in pairs(highlights) do
       hl(0, modes, { bg = colors })
       print("modes = colors")
   end
end

return X
--hl(0, name, val)
