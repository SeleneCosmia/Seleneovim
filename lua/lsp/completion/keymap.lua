local ls = require 'luasnip'
local cmp =  require 'cmp'
local contxt = require 'cmp.context'
local X = {}
local map = cmp.mapping

--[[
local keymaps = map.preset.insert {
    ['<C-Space>'] = function()
      if not cmp.visible then
        map.complete()
      end,
    end,

    ['<C-n>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      end
    end,
}
]]
