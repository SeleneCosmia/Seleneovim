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

  {
    'danymat/neogen',
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { snippet_engine = 'luasnip' },
  },

  { 'Vigemus/iron.nvim' },
}
