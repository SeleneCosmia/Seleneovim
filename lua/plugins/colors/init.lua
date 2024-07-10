return {
    {
        'rktjmp/lush.nvim',
        cmd = { 'Lushify' },
        dependencies = {
            'rktjmp/shipwright.nvim',
            cmd = { 'Shipwright' },
        },
    },

    {
        'brenoprata10/nvim-highlight-colors',
        ft = { 'css', 'html', 'sass', 'scss', 'stylus' },
        config = function()
            require 'nvim-highlight-colors'.setup()
        end
    },

    { require 'plugins.colors.schemes' },
}
