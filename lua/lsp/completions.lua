local cmp, types = require 'cmp', require 'cmp.types'
local autopairs = require 'nvim-autopairs.completion.cmp'
local luasnip = require 'luasnip'

local map, cmpr = cmp.mapping, cmp.config.compare

local insert = { behavior = types.cmp.SelectBehavior.Insert }
local select = { behavior = types.cmp.SelectBehavior.Select }

---@module "cmp"
---@type cmp.Setup
cmp.setup({
  experimental = { ghost_text = true },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  preselect = cmp.PreselectMode.Item,

    --  ╭──────────────────────────────────────────────────────╮
    --  │                              Keymapping Functions    │
    --  ╰──────────────────────────────────────────────────────╯

  mapping = {
    ['<C-Space>'] = map.complete(),

    ['<CR>'] = map.confirm({
      select = false,
      behavior = cmp.ConfirmBehavior.Insert
    }),

    ['<Tab>'] = map(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(select)
      else
        fallback()
      end
    end),

    ['<S-Tab>'] = map(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select)
      else
        fallback()
      end
    end),

    ['<C-]>'] = map(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump(1)
      end
    end),

    ['<C-[>'] = map(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump(-1)
      end
    end),

    ['<C-n>'] = map(function()
      if cmp.visible_docs() then
        cmp.scroll_docs(4)
      else
        cmp.select_next_item(select)
      end
    end),

    ['<C-p>'] = map(function()
      if cmp.visible_docs() then
        cmp.scroll_docs(-4)
      else
        cmp.select_prev_item(select)
      end
    end),

    ['<ESC>'] = map(function(fallback)
      if cmp.visible() then
        cmp.abort()
      else
        fallback()
      end
    end),
  },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                         Sources                          │
    --  ╰──────────────────────────────────────────────────────────╯

  sources = {
    { name = 'lazydev', group_index = 0 },
    { name = 'nvim_lsp' },
    { name = 'luasnip'  },
    { name = 'async_path' },
    { name = 'env', trigger_characters = {'$'} },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      }
    },
  },

    --  ╭────────────────────────────────╮
    --  │  Sorting & Matching Functions  │
    --  ╰────────────────────────────────╯

  matching = {
    disallow_fuzzy_matching = true,
  },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                 Popup Window Formatting                  │
    --  ╰──────────────────────────────────────────────────────────╯

  view = {
    docs = {
      auto_open = true,
    },
    entries = {
      follow_cursor = true,
      vertical_positioning = 'above',
    }
  },


  window = {
    completion = {
      border = 'rounded',
      scrollbar = false,
    },
    documentation = {
      border = 'rounded',
      -- winhighlight = winhl,
      -- max_height = math.floor(vim.o.lines * 0.5),
      -- max_width = math.floor(vim.o.columns * 0.75),
    },
  },

  formatting = {
    expandable_indicator = true,
    fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, item)
        local item_maxwidth = 30
        local ellipsis_char = '🠶'

        ---@diagnostic disable-next-line: redefined-local
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

        -- local get_menu_icon = function(name, icon)
        --   for _, name in ipairs(vim.tbl_keys())
        -- end

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

          item.menu = truncate(item.menu)
          item.abbr = truncate(item.abbr)

          return item
        end,
    },
})

cmp.setup.filetype('sh', {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'async_path' },
    { name = 'env', trigger_characters = {'$'}}
  }
})
