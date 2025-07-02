local left_sep = require 'utils.icons'.left_sep
local right_sep = require 'utils.icons'.right_sep
local ICON = require 'utils.icons'.diagnostic_icons
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
        refresh = { statusline = 100 },
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
            sections = { 'error', 'warn', 'info' },
            sources = { 'nvim_diagnostic', 'nvim_lsp', 'vim_lsp' },
            symbols = { error = ICON.Error, warn = ICON.Warn, info = ICON.Info },
          },
        },
        lualine_c = {
          {
            'filename',
            symbols = {
              modified = '󱇨 ',
              newfile = '󰈤 ',
              readonly = '󰊪 ',
            },
          },
        },
        lualine_x = {
          {
            'filetype',
            colored = true,
            icon_only = false,
            icon = { align = 'right' },
          }
        },
        lualine_y = { 'location' },
        lualine_z = { "os.date('%H:%M %p')" },
      },
      extensions = { 'lazy', 'mason', 'nvim-tree' },
    },
  },
}
