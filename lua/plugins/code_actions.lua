---@type LazySpec[]
return {
  {
    'aznhe21/actions-preview.nvim',
    opts = {
      backend = { 'snacks', 'telescope', 'nui' },
      snacks = {
        layout = { preset = 'default' },
      },
    }
  },
}
