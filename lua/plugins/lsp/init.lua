---@type LazySpec[]
return {
  { require 'plugins.lsp.mason' },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'saghen/blink.cmp' },
      { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    },
    config = function()
      require 'neoconf'.setup {}
      require 'lsp.servers'.setup()
    end,
  },

  { require 'plugins.lsp.formatter' },
  { require 'plugins.lsp.lazydev' },
  { require 'plugins.lsp.ftplugins' },
  { require 'plugins.lsp.diagnostics' },
}
