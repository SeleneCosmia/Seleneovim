return {
  {
    'stevearc/conform.nvim',
    cmd = 'ConformInfo',
    event = 'VeryLazy',
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        -- stylua: ignore start
        crystal = { 'crystal' },
        fish    = { 'fish_indent' },
        lua     = { 'stylua' },
        toml    = { 'taplo' },
        ['*']   = { 'trim_whitespace', 'trim_newlines' },
        -- stylua: ignore end
      },
      default_format_opts = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
    },
    keys = {
      { '<leader>ff', '<cmd>lua require("conform").format({})<cr>', { modes = { 'n', 'x' }}},
    },
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    },
    config = function()
      local lspconfig = require 'lspconfig'
      ----------------------------------------------------------------
      require 'neoconf'.setup {}
      -------------- Mason setup
      require 'lsp.mason'.config()
      require 'lsp.mason'.mason_lspconfig()

      require 'lsp.servers'.init(lspconfig)
    end
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {},
  },

  { require 'plugins.lsp.lazydev' },
  { require 'plugins.lsp.ftplugins' },
}
