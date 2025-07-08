---@diagnostic disable:inject-field

---@type LazySpec[]
return {
  { 'bezhermoso/tree-sitter-ghostty', build = 'make nvim_install' },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'master',
    build = ':TSUpdate',
    config = function()
      local treesitter = require 'nvim-treesitter.configs'
      local default_parsers = require 'utils.globals'.ts_parsers

      treesitter.setup({
        ensure_installed = default_parsers,
        sync_install = true,
        auto_install = false,
        indent = {
          enable = true,
          disable = { 'lua' },
        },
        highlight = {
          enable = true,
          use_languagetree = true,
          additional_vim_regex_highlighting = { 'bash' },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { 'BufWrite', 'CursorHold' },
        },
      })
    end,
  },

  {
    'lewis6991/ts-install.nvim',
    config = function()
      require 'ts-install'.setup({
        parsers = {
          crystal = {
            install_info = {
              url = 'https://github.com/crystal-lang-tools/tree-sitter-crystal',
              branch = 'main',
              queries_dir = 'queries/nvim',
            },
          },
          d2 = {
            install_info = {
              url = 'https://github.com/ravsii/tree-sitter-d2',
            },
          },
        },
        auto_update = true,
        ensure_install = {
          'crystal',
        }
      })
    end,
  },
}
