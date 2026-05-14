---@type LazySpec[]
return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim' },
    ---@module 'noice'
    ---@type NoiceConfig
    opts = {
      lsp = {
        enabled = true,
        signature = { opts = { border = vim.g.border }},
        hover = { opts = { border = vim.g.border }},
        documentation = {
          opts = {
            win_options = {
              concealcursor = 'n',
              conceallevel = 3,
              winhighlight = { Normal = 'LspFloat' },
            },
          },
        },
      },
      -- override = {
      --   ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      --   ['vim.lsp.util.stylize_markdown'] = true,
      --   ['cmp.entry.get_documentation'] = true,
      -- },
      ---@type NoicePresets
      presets = {
        bottom_search = true,
        command_palette = true,
        lsp_doc_border = true,
        long_message_to_split = true,
      },
    },
  },
}
