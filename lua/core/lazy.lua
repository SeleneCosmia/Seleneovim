local api = vim.api
local devpath = vim.fn.expand('$GITHUB_ROOT')
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local lazyclone = { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  vim.system(lazyclone, { text = true }, function(job)
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
      path = devpath,
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
          '2html_plugin',
          'compiler',
          'gzip',
          'matchit',
          'matchparen',
          'tar',
          'tarPlugin',
          'tohtml',
          'tutor',
          'zip',
          'zipPlugin',
        },
      },
    },
  }
  return require 'lazy'.setup('plugins', opts)
end

vim.opt.rtp:prepend(lazypath)
lazy_setup()
