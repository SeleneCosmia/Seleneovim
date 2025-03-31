---@type LazySpec[]
return {
  {
    'nvim-lualine/lualine.nvim',
    -- Loads plugin earlier than VimEnter
    event = 'UIEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = '🮜', right = '🮝' },
      },
    },
  },
}
