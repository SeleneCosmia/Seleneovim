local uv, api, fn, set = (vim.uv or vim.loop), vim.api, vim.fn, vim.g
local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
local lazygit = 'git clone --filter=blob:none ' .. lazyrepo .. ' --branch=stable'

local X = {}

function X.lazy_boot()
    if not uv.fs_stat(lazypath) then
        local out = fn.system({ lazygit, lazypath })
        if vim.v.shell_error ~= 0 then
            api.nvim_echo({
                { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
                { out, 'WarningMsg' },
                { '\nPress any key to exit...' },
            }, true, {})
            fn.getchar()
            os.exit(1)
        end
    end
    return vim.opt.rtp:prepend(lazypath)
end
---󰞦---󰞦---󰞦---󰞦---󰞦---󰞦---------------------

local dev_path = vim.fn.expand('$GITHUB_ROOT')

function X.lazy_setup()
local opts, no_notif = {}, {}

  no_notif = {
    enabled = true,
    notify = false
  }

  opts = {
    checker = no_notif,
    change_detection = no_notif,
    ui = { border = 'rounded' },
    dev = {
      path = dev_path,
      patterns = { '*.nvim', 'nvim-plugins' },
      fallback = true,
    },
    install = {
      colorscheme = { 'sunset_cloud' },
    },
    performance = {
      rtp = {
        disabled_plugins = {
          'gzip',
          'matchparen',
          'netrw',
          'netrwPlugin',
          'rrhelper',
          'tar',
          'tarPlugin',
          'tutor',
          'vimball',
          'vimballPlugin',
          'zip',
          'zipPlugin',
        }
      }
    }
  }
  return require 'lazy'.setup('plugins', opts)
end

return X
