return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'saghen/blink.cmp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    },
    config = function()
      local lspconfig = require 'lspconfig'
      ----------------------------------------------------------------
      require 'neoconf'.setup {}
      -------------- Mason setup
      require 'lsp.config.mason'.setup('mason')
      require 'lsp.config.mason'.setup('mason-lspconfig')

      require 'lsp.servers'.setup()
    end,
  },

  { require 'plugins.lsp.formatter' },
  { require 'plugins.lsp.lazydev' },
  { require 'plugins.lsp.ftplugins' },
  { require 'plugins.lsp.diagnostics' },
}
