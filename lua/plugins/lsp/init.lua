---@type LazySpec[]
return {
  { require 'plugins.lsp.mason' },

  {
    'neovim/nvim-lspconfig',
    event = 'VimEnter',
    dependencies = { 'saghen/blink.cmp' },
  },

  { require 'plugins.lsp.formatter' },
  { require 'plugins.lsp.diagnostics' },
}
