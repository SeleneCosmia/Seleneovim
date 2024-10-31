local cmp, types = require 'cmp', require 'cmp.types'
local autopairs = require 'nvim-autopairs.completion.cmp'
local luasnip = require 'luasnip'

local map, cmpr = cmp.mapping, cmp.config.compare

local insert = { behavior = types.cmp.SelectBehavior.Insert }
local select = { behavior = types.cmp.SelectBehavior.Select }

local winhl = 'Normal:PMenu,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None'

---@type cmp.Setup
cmp.setup({

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  preselect = cmp.PreselectMode.None,

  confirmation = {
    default_behavior = types.cmp.ConfirmBehavior.Replace
  },

    --  ╭──────────────────────────────────────────────────────╮
    --  │                              Keymapping Functions    │
    --  ╰──────────────────────────────────────────────────────╯

  mapping = map.preset.insert {
    ['<C-Space>'] = map.complete(),
    ['<CR>'] = map.confirm({ behavior = types.cmp.ConfirmBehavior.Replace }),

    ['<Tab>'] = map(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump(1)
      elseif cmp.visible() then
        cmp.select_next_item(insert)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = map(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump(-1)
      elseif cmp.visible() then
        cmp.select_prev_item(insert)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-n>'] = map(function()
      if cmp.visible_docs() then
        cmp.scroll_docs(1)
      else
        cmp.select_next_item(select)
      end
    end, { 'i', 's' }),

    ['<C-p>'] = map(function()
      if cmp.visible_docs() then
        cmp.scroll_docs(-1)
      else
        cmp.select_prev_item(select)
      end
    end, { 'i', 's' }),

    ['<ESC>'] = map(function(fallback)
      if cmp.visible() then
        cmp.abort()
      else
        fallback()
      end
    end, { 'i', 's' }),

  },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         Sources                          │
    --  ╰──────────────────────────────────────────────────────────╯

    sources = cmp.config.sources({
      { name = 'nvim_lsp', group_index = 1 },
      { name = 'luasnip', group_index = 1 },
      { name = 'async_path' },
    {
      { name = 'env' },
      { name = 'buffer' },
    }}),

    --  ╭────────────────────────────────╮
    --  │  Sorting & Matching Functions  │
    --  ╰────────────────────────────────╯

  matching = {
    disallow_fuzzy_matching = true,
    disallow_fullfuzzy_matching = false,
    disallow_partial_fuzzy_matching = true,
  },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                 Popup Window Formatting                  │
    --  ╰──────────────────────────────────────────────────────────╯

  view = {
    docs = {
      auto_open = true,
    }
  },

  window = {
    completion = {
      border = 'rounded',
      scrollbar = false,
      winhighlight = winhl,
    },
    documentation = {
      border = 'rounded',
      winhighlight = winhl,
      max_height = math.floor(vim.o.lines * 0.5),
      max_width = math.floor(vim.o.columns * 0.5),
    },
  },

  formatting = {
    expandable_indicator = true,
    fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, item)
        local item_maxwidth = 30
        local ellipsis_char = '🠶'

        ---@param item string
        ---@return string limited string
        local function truncate(item)
          if item ~= nil and item:len() > item_maxwidth then
            item = item:sub(0, item_maxwidth) .. ellipsis_char
            return item
          end
          return item
        end

        item.menu = ({
          nvim_lsp      = '[LSP]',
          luasnip       = '[SNIP]',
          buffer        = '[BUF]',
          async_path    = '[PATH]',
          env           = '[$ENV]',
        })[entry.source.name]

        local menu_icon = {
          nvim_lsp      = '  ',
          luasnip       = '  ',
          buffer        = '  ',
          async_path    = ' 󰙁 ',
          env           = '  ',
        }

        --cannot for the life of me figure out a less hacky way
        --to set this up
        if entry.source.name == 'nvim_lsp' then
          item.kind = menu_icon.nvim_lsp
        elseif entry.source.name == 'luasnip' then
          item.kind = menu_icon.luasnip
        elseif entry.source.name == 'buffer' then
          item.kind = menu_icon.buffer
        elseif entry.source.name == 'async_path' then
          item.kind = menu_icon.async_path
        elseif entry.source.name == 'env' then
          item.kind = menu_icon.env
        end

        --[[for src, icon in pairs(menu_icon) do
          local stringify = function()
            string.format()
          end
          if entry.source.name == 
            item.kind = menu_icon[src]
        end]]

          item.menu = truncate(item.menu)
          item.abbr = truncate(item.abbr)

          return item
        end,
    },
})

cmp.setup.filetype('lua', {
  sources = cmp.config.sources({
    { name = 'lazydev', group_index = 0 },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    {
      { name = 'buffer', keyword_length = 3 },
      { name = 'async_path' },
    }
  })
})

cmp.setup.filetype('sh', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'env' }
  })
})
