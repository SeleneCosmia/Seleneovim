local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
---󰞦---󰞦---󰞦---󰞦---󰞦---󰞦---------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'lazy'.setup('plugins', {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                '2html_plugin',
                'gzip',
                'matchit',
                'matchparen',
                'netrw',
                'netrwPlugin',
                'tar',
                'tarPlugin',
                'tohtml',
                'tutor',
                'vimball',
                'vimballPlugin',
                'zip',
                'zipPlugin',
            },
        },
    },
    ui = { border = 'rounded' },
})
