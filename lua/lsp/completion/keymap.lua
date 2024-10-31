local luasnip = require 'luasnip'
local cmp =  require 'cmp'
local contxt = require 'cmp.context'
local map = cmp.mapping
local select = { behavior = cmp.SelectBehavior.Select }
local insert = { behavior = cmp.SelectBehavior.Insert }

local X = {}

local select_next_item = function(fallback)
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif cmp.visible() then
    cmp.select_next_item({ insert })
  else
    fallback()
  end
end

local select_prev_item = function(fallback)
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump(-1)
  elseif cmp.visible() then
    cmp.select_prev_item({ insert })
  else
    fallback()
  end
end

X.keymaps = {
  ['<C-Space>'] = map({
    i = function()
      map.complete()
    end,
  }),
}
