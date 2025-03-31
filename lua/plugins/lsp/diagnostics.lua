---@type LazySpec[]
return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
    opts = {
      preset = 'powerline',
      options = {
        use_icons_from_diagnostic = true,
        multilines = true,
      }
    },
  },
}
