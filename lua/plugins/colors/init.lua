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
        event = 'VeryLazy',
        config = true
    },

    { require 'plugins.colors.schemes' },
}
