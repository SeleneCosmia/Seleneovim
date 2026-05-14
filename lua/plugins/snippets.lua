local snippets_path = vim.fn.stdpath('config') .. '/snippets'

---@type LazySpec[]
return {
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    version = 'v2.*',
    -- event = 'InsertEnter',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      local ls = require 'luasnip'

      ls.setup({
        keep_roots = true,
        update_events = { 'TextChanged', 'TextChangedI' },
        delete_check_events = 'TextChanged',
        enable_autosnippets = true,
      })

      require 'luasnip.loaders.from_vscode'.lazy_load()
      require 'luasnip.loaders.from_vscode'.lazy_load {
        paths = { snippets_path },
      }
    end,
  },

  {
    'chrisgrieser/nvim-scissors',
    cmd = { 'ScissorsAddNewSnippet', 'ScissorsEditSnippet' },
    dependencies = { 'folke/snacks.nvim' },
    opts = {
      snippetDir = snippets_path,
      jsonFormatter = 'jq',
    },
  },

}
