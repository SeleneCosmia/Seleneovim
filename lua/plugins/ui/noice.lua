---@type LazySpec[]
return {
  {
    'folke/noice.nvim',
    dependencies = { 'folke/snacks.nvim' },
    ---@module 'noice'
    ---@type NoiceConfig
    opts = {
      routes = {
        {
          filter = {
            event = 'notify',
            any = {{ find = 'No information available' }},
          },
          opts = { skip = true },
        },
      },
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
      presets = {
        bottom_search = true,
        command_palette = true,
        lsp_doc_border = true,
      },
    },
  },
}
