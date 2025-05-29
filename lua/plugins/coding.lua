---@type LazySpec[]
return {
  {
    'aznhe21/actions-preview.nvim',
    event = 'LspAttach',
    opts = {
      backend = { 'snacks', 'telescope', 'nui' },
      snacks = {
        layout = { preset = 'default' },
      },
    },
  },

  { 'Vigemus/iron.nvim' },
}
