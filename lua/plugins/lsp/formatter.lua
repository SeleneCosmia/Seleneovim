---@type LazySpec[]
return {
  {
    'stevearc/conform.nvim',
    cmd = 'ConformInfo',
    event = 'VeryLazy',
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      formatters = {
        runic = {
          command = 'julia',
          args = { '--project=@nvim-lspconfig', '-e', 'using Runic; exit(Runic.main(ARGS))' },
        },
      },
      formatters_by_ft = {
        -- stylua: ignore start
        bash    = { 'shellcheck', 'shfmt' },
        crystal = { 'crystal' },
        css     = { 'stylelint' },
        fish    = { 'fish_indent' },
        julia   = { 'runic' },
        lua     = { 'stylua' },
        sugarss = { 'styelint' },
        toml    = { 'taplo' },
        ['*']   = { 'trim_whitespace', 'trim_newlines' },
        -- stylua: ignore end
      },
      default_format_opts = {
        lsp_format = 'fallback',
        timeout_ms = 1000,
      },
    },
    keys = {
      { '<leader>ff', '<cmd>lua require("conform").format({})<cr>', { modes = { 'n', 'x' } } },
    },
  },
}
