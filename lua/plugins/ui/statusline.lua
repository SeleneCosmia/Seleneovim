local left_sep = require 'utils.icons'.left_sep
local right_sep = require 'utils.icons'.right_sep
---@type LazySpec[]
return {
  {
    'nvim-lualine/lualine.nvim',
    -- Loads plugin earlier than VimEnter
    event = 'UIEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = left_sep, right = right_sep },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          {
            'diff',
            symbols = {
              added = ' ',
              modified = ' ',
              removed = ' ',
            },
          },
          {
            'diagnostics',
            sources = { 'nvim_diagnostic', 'nvim_lsp', 'vim_lsp' },
          },
        },
        lualine_c = {
          {
            'filename',
            symbols = {
              modified = ' ',
              newfile = ' ',
            },
          },
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { "os.date('%R %p')" },
      },
    },
  },
}
