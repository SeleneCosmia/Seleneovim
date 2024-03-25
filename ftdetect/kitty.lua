local aucmd = vim.api.nvim_create_autocmd
local kitty_file = { 'kitty.conf', '*/kitty/*.conf', '*/kitty/*/*.conf' }
local events = {'BufNewFile','BufRead'}

aucmd(events, {
    pattern = kitty_file,
    callback = function()
        vim.cmd.setfiletype 'kitty'
    end,
})

aucmd(events, {
    pattern = { '*/kitty/*.session' },
    callback = function()
        vim.cmd.filetype 'kitty-session'
    end,
})
