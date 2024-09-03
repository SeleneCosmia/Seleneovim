local uv, api, fn, set = (vim.uv or vim.loop), vim.api, vim.fn, vim.g
local dev_path = vim.fn.expand('$GITHUB_ROOT')
local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'

if not uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out =
    fn.system({'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
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
vim.opt.rtp:prepend(lazypath)

---@param opts? LazyConfig
local function lazy_setup(opts)
local no_notif = {}
  no_notif = { enabled = true, notify = false }
  opts = opts or {}
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
          'tarPlugin',
          'tutor',
          'zipPlugin',
        }
      }
    }
  }
  return require 'lazy'.setup('plugins', opts)
end

lazy_setup()
