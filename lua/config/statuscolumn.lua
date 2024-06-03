local builtin = require 'statuscol.builtin'

return {
    setopt = true,
    ft_ignore = {
        'neo-tree',
        'help',
    },
    segments = {
        {
            text = { builtin.foldfunc },
            click = 'v:lua.ScFa',
            maxwidth = 1,
            colwidth = 1,
            auto = false,
        },
        {
            sign = {
                namespace = { '.*', 'Diagnostic*', '.*' },
                maxwidth = 2,
                colwidth = 2,
            },
            auto = true,
            click = 'v:lua.ScSa',
            condition = { true, builtin.not_empty },
        },
        {
            text = { builtin.lnumfunc, ' ' },
            click = 'v:lua.ScLa',
            condition = { true, builtin.not_empty },
        },
        {
            text = { '┇' },
            hl = 'Todo',
            condition = { true, builtin.not_empty },
        },
        { text = { ' ' } },
    },
}
