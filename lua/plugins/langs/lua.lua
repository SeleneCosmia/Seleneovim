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
        { 'lazy.nvim', words = { 'lazy', 'LazySpec' }},
        { path = '${3rd}/luv/library', words = { 'vim%.uv' }},
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },
}
