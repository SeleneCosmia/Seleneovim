return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        version = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            '3rd/image.nvim',
        },
        config = function()
            require 'config.neotree'
        end
    },
}

