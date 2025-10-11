---@type LazySpec[]
return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = {
      { 'DrKJeff16/wezterm-types', lazy = true },
      { 'SeleneCosmia/awesomewm-types', lazy = true },
      { 'Bilal2453/luvit-meta', lazy = true },
    },
    ---@module 'lazydev'
    ---@type lazydev.Config
    opts = {
      ---@type lazydev.Library.spec[]
      library = {
        { 'lazy.nvim', words = { 'lazy', 'LazySpec' }},
        { path = '${3rd}/luv/library', words = { 'vim%.uv' }},
        { path = 'wezterm-types', mods = { 'wezterm' }},
        { path = 'awesomewm-types', mods = { 'awful', 'awesome', 'beautiful', 'gears' }}
      },
    },
  },
}
