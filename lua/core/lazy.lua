local api, set = vim.api, vim.g
local dev_path = vim.fn.expand('$GITHUB_ROOT')
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

local lazy_repo = 'https://gtihub.com/folke/lazy.nvim.git'
local lazy_clone_cmd = { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazy_repo, lazy_path }

if not vim.uv.fs_stat(lazy_path) then
  vim.system(lazy_clone_cmd, { text = true }, function(job)
    if job.code == 0 then
      print('Install lazy.nvim!')
    end
  end)
end

---@param opts? LazyConfig
local function lazy_setup(opts)
  local no_notif = { enabled = true, notify = false }

  opts = opts or {}
  ---@module 'lazy'
  ---@type LazyConfig
  opts = {
    checker = no_notif,
    change_detection = no_notif,
    ui = { border = 'rounded' },
    dev = {
      path = dev_path,
      patterns = { '*.nvim', 'nvim-plugins' },
      fallback = true,
    },
    git = {
      timeout = 300,
      throttle = {
        enabled = false,
        rate = 2,
        duration = 5000,
      },
    },
    performance = {
      cache = { enabled = true },
      rtp = {
        disabled_plugins = {
          'gzip',
          'matchit',
          'matchparen',
          'tarPlugin',
          'tohtml',
          'tutor',
          'zipPlugin',
        },
      },
    },
  }
  return require 'lazy'.setup('plugins', opts)
end

vim.opt.rtp:prepend(lazy_path)
lazy_setup()
