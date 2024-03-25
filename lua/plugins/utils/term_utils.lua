return {
    {
        'RAprogramm/nekifoch',
        cmd = 'Nekifoch',
        enabled = function()
            if os.getenv('TERM') == 'xterm-kitty' then
                return true
            else
                return false
            end
        end,
        opts = {},
    },

    {
        'akinsho/toggleterm.nvim',
        event = 'VeryLazy',
        version = '*',
        opts = {}
    }
}
