local theme = {}
local gruvbox = require 'gruvbox-baby.colors'.p

theme.gruvbox = {
    fg = gruvbox.foreground,            -- #EBDBB2
    bg = gruvbox.background_dark,       -- #1D2021
    black = gruvbox.dark0,              -- #0D0E0F
    skyblue = gruvbox.light_blue,       -- #7FA2AC
    cyan = gruvbox.clean_green,         -- #8EC07C
    green = gruvbox.soft_green,         -- #98971A
    oceanblue = gruvbox.blue_gray,      -- #458588
    magenta = gruvbox.magenta,          -- #B16286
    orange = gruvbox.orange,            -- #D65D0E
    red = gruvbox.error_red,            -- #CC241D
    violet = gruvbox.pink,              -- #D4879D
    white = gruvbox.milk,               -- #E7D7AD
    yellow = gruvbox.bright_yellow      -- #FABD2F
}

local kx = require 'kimbox.colors'

theme.kimbox = {
    fg = kx.fg3,                -- #C2A383
    bg = kx.wenge_black,        -- #41292C
    black = kx.bg1,             -- #39260E
    oceanblue = kx.blue,        -- #4C96A8
    skyblue = kx.aftercare,     -- #88C0D0
    cyan = kx.amethyst,         -- #938AA9
    green = kx.army_green,      -- #445321
    magenta = kx.carnation,     -- #F77B91
    violet = kx.watermelon,     -- #EC5F91
    red = kx.vivid_burgundy,    -- #961134
    orange = kx.cure_all,       -- #A76C8C
    white = kx.birdseed,        -- #E2C290
    yellow = kx.yellow          -- #FF9500
}

theme.vi_mode_hl = {
    gruvbox = {
        n = gruvbox.clean_green,
        no = gruvbox.clean_green,
        i = gruvbox.pink,
        v = gruvbox.blue_gray,
        V = gruvbox.light_blue,
        [""] = gruvbox.light_blue,
        c = gruvbox.orange,
        cv = gruvbox.orange,
        ce = gruvbox.orange,
        R = gruvbox.bright_yellow,
        Rv = gruvbox.bright_yellow,
        s = gruvbox.error_red,
        S = gruvbox.error_red,
        t = gruvbox.forest_green
    }
}

return theme
