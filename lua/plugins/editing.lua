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
    opts = { fast_wrap = {} },
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },
}
