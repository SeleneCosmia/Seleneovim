return {
    {
        'Fymyte/rasi.vim',
        ft = 'rasi',
        build = ':TSInstall rasi',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },

    { 'jlcrochet/vim-crystal', ft = 'crystal' },

    { 'instance-id/nvim-cyber', ft = 'cyber', build = ':TSInstall cyber' },
}
