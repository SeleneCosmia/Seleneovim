local X = {}

X.css = {
    {
        'cjodo/convert.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        keys = {
            { '<leader>cv', '<cmd>ConvertFindCurrent<cr>', desc = 'Find convertable unit in the current line' },
            { '<leader>cc', '<cmd>ConvertAll<cr>', desc = 'Convert ALL of a specified unit' },
        },
        config = function()
            local convert = require 'convert'
            convert.setup({})
        end,
    },
}

return X
