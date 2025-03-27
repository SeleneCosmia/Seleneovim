local AwesomeWM = {}
AwesomeWM.config_files = {
  '~/.config/awesome/rc.lua',
  '~/.config/awesome/core/' .. '(%a+)%.lua',
  '~/.config/awesome/ui/' .. '^(%a+/)?%a%.lua$',
  '~/.config/awesome/utils/' .. '^(%a+/)?%a%.lua$'
}

---@type LazySpec[]
return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    ---@module 'lazydev'
    ---@type lazydev.Config
    opts = {
      ---@type lazydev.Library.spec[]
      library = {
        { path = '~/.config/awesome/libs/awesome', files = AwesomeWM.config_files },
        { path = '~/.config/awesome/libs/lgi', mods = { 'lgi' }},
        { 'lazy.nvim', words = { 'lazy', 'LazySpec%[%]' }},
        { path = '${3rd}/luv/library', words = { 'vim%.uv' }},
      },

    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },
}
