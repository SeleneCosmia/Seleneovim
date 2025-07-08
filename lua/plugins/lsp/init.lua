---@type LazySpec[]
return {
  { require 'plugins.lsp.mason' },

  {
    'neovim/nvim-lspconfig',
    event = 'VimEnter',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      require 'lsp.servers'.setup()
    end,
  },

  { require 'plugins.lsp.formatter' },
  { require 'plugins.lsp.ftplugins' },
  { require 'plugins.lsp.diagnostics' },
}
