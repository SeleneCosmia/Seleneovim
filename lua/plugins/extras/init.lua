return {
    { -- needs to load before any other plugins are loaded
        'vhyrro/luarocks.nvim',
        priority = 11001,
        opts = {
            rocks = { 'magick', 'hsluv', 'warna' },
        },
    },
    {
        '3rd/image.nvim',
        dependencies = { 'luarocks.nvim' },
        config = function(term)
            --[[-@![todo]: config image.nvim in it's own config file ~~
            maybe a broad terminal detetction config, loading specific plugins[^1]

            [1]:
                -[] i.e nekifoch only loads with kitty
                -[] rio should not load image.nvim for now, etc

            --local terminals = { 'kitty', 'wezterm', 'rio', 'contour' }]]
            require 'image'.setup({})
        end,
    },
}
