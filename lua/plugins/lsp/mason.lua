local config = {}
config.mason = {
  ui = {
    border = 'rounded',
    height = 0.8,
    width = 0.75,
    icons = {
      package_installed = '',
      package_pending = '󰴲',
      package_uninstalled = '',
    },
    registries = {
      'github:mason-org/mason-registry',
      'github:mkindberg/ghostty-ls',
    },
  },
}

---@type LazySpec[]
return {
  {
    'mason-org/mason-lspconfig.nvim',
    event = 'VimEnter',
    dependencies = {
      { 'mason-org/mason.nvim', opts = config.mason },
      'neovim/nvim-lspconfig',
    },
    opts = {},
  },
}
