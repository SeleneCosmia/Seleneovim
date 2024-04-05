---@diagnostic disable:unused-local
--#selene: allow(unused_variable)
local feline = require 'feline'
--local gruvbox = require 'ui.feline.themes'.gruvbox
local kimbox = require 'ui.feline.themes'.kimbox

local progress = { '🟎', '󰪁', '󰫢', '⚸', '', '', '' }


feline.add_theme('kimbox', kimbox)

local c = {
    mode_icon = {
        provider = { name = 'vi_mode' },
        icon = {
            str = '  ',
            hl = {
                fg = require 'feline.providers.vi_mode'.get_mode_color(),
                bg = kimbox.black,
                style = 'bold'
            },
        },
        always_visible = true,
        right_sep = {
            str = ''
        },
        left_sep = {
            str = '',
        }
    },
    file_info = {
        provider = require 'feline.providers.file'.file_info()
    }

}

local components = {
    active = {},
    inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

table.insert(components.inactive, {})
table.insert(components.inactive, {})
