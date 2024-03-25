-- Autodetecting bash files based on my custom
--      config / completion directories

local aucmd = vim.api.nvim_create_autocmd

local bash_scripts = vim.fn.expand('~') .. '/.config/bash/.*/*'
local comp_scripts = vim.fn.expand('$XDG_DATA_HOME') .. '/bash-completion/completions/*'

local events = { 'BufNewFile', 'BufRead' }
local bash_files = { comp_scripts, bash_scripts, '.*/bash/*.bash' }

aucmd(events, {
    pattern = bash_files,
    callback = function()
        vim.cmd.setfiletype 'sh'
    end,
})
