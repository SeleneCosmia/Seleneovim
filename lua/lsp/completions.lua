local cmp = require 'cmp'
local autopairs = require 'nvim-autopairs.completion.cmp'
local luasnip = require 'luasnip'

local map = cmp.mapping
local cmpr = cmp.config.compare

local winhl = 'Normal:PMenu,FloatBorder:PMenu,CursorLine:ModesVisualCursorLine,Search:None'
local b_replace = cmp.ConfirmBehavior.Replace

cmp.setup({

    preselect = 'None',

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    --  ╭──────────────────────────────────────────────────────╮
    --  │                              Keymapping Functions    │
    --  ╰──────────────────────────────────────────────────────╯

    mapping = map.preset.insert {
        ['<C-Space>'] = map.complete(),
        ['<Up>'] = map.select_prev_item({ behavior = 'select' }),
        ['<Down>'] = map.select_next_item({ behavior = 'select' }),
        ['<CR>'] = map.confirm({ behavior = b_replace }),

        -----|>|>|> cmp-docs commands
        ['<C-e>'] = map(function(fallback)
            if cmp.visible_docs() then
                cmp.close_docs()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-n>'] = map(function(fallback)
            if cmp.visible_docs() then
                cmp.scroll_docs(1)
            else
                cmp.select_next_item({ behavior = 'select' })
            end
        end, { 'i', 's' }),

        ['<C-p>'] = map(function(fallback)
            if cmp.visible_docs() then
                cmp.scroll_docs(-1)
            else
                cmp.select_prev_item({ behavior = 'select' })
            end
        end, { 'i', 's' }),

        -----|>|>|> cmp open/close cmds

        ['<C-c>'] = map(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<ESC>'] = map(function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                fallback()
            end
        end, { 'i', 's' }),


        ['<A-p>'] = map(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<A-l>'] = map(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump(-1)
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
        { name = 'path' },
    }, {
        { name = 'env' },
        { name = 'buffer', keyword_length = 3 },
    }),

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
            winhighlight = winhl,
            max_height = math.floor(vim.o.lines * 0.5),
            max_width = math.floor(vim.o.columns * 0.5),
        },
    },

    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, item)
            local maxw_abbr = 25
            local truncd = '‣'

            item.menu = ({
                nvim_lua = '[API]',
                nvim_lsp = '[LSP]',
                luasnip  = '[SNIP]',
                buffer   = '[BUF]',
                path     = '[PATH]',
                env      = '[$ENV]',
                fonts    = '[FONT]',
            })[entry.source.name]

            local menu_icon = {
                nvim_lua =  ' 󰽥  ',
                nvim_lsp =  '   ',
                luasnip =   '   ',
                buffer =    '   ',
                path =      '   ',
                env =       ' 🏞 ',
                fonts =     ' 󰛖  ',
            }
            -- cannot for the life of me figure out a less hacky way
            -- to set this up
            if entry.source.name == 'nvim_lua' then
                item.kind = menu_icon.nvim_lua
            elseif entry.source.name == 'nvim_lsp' then
                item.kind = menu_icon.nvim_lsp
            elseif entry.source.name == 'luasnip' then
                item.kind = menu_icon.luasnip
            elseif entry.source.name == 'buffer' then
                item.kind = menu_icon.buffer
            elseif entry.source.name == 'path' then
                item.kind = menu_icon.path
            elseif entry.source.name == 'env' then
                item.kind = menu_icon.env
            end

            if vim.api.nvim_strwidth(item.abbr) > maxw_abbr then
                item.abbr = vim.fn.strcharpart(item.abbr, 0, maxw_abbr) .. truncd
            end

--[[        if vim.api.nvim_strwidth(item.menu or '') > maxw_menu then
                item.menu =
            end
            ]]
            return item
        end,
    },
})

cmp.setup.filetype('lua', {
    sources = cmp.config.sources({
        { name = 'lazydev', group_index = 0 },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
    }, {
        { name = 'path' },
        { name = 'buffer', keyword_length = 3 },
    }, {
        { name = 'env' },
    }),
})

cmp.setup.filetype('sh', {
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }, {
        { name = 'path' },
        { name = 'env' }
    })
})
