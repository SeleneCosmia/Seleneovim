---@type LazySpec[]
return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    priority = 1000,
    opts = {
      preset = 'powerline',
      options = {
        use_icons_from_diagnostic = true,
        multilines = {
          enabled = true,
          always_show = false,
          tabstop = 2,
        },
        show_source = {
          enabled = false,
          if_many = true,
        },
      },
    },
  },
}
