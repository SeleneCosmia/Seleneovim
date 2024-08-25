local ls = require 'luasnip'
local cmp =  require 'cmp'
local contxt = require 'cmp.context'
local X = {}
local map = cmp.mapping

--[[
local keymaps = {

  ['<C-Space>'] = map({
    i = function()
      map.complete()
    end,
  }),
  ['<C-Down>'] = map({
    i = function(fallback)
      if cmp.visible() then
        cmp.select_next_item({
          behavior = cmp.SelectBehavior.Select
        })
      else 
      end,
  end,
}
]]
