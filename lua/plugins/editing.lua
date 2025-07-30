---@type LazySpec[]
return {
  {
    'MagicDuck/grug-far.nvim',
    opts = {
      enabledEngines = { 'ripgrep' },
    },
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {},
  }
}
