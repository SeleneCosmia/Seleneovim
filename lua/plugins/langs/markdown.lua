---@type LazySpec[]
return {
  {
    'OXY2DEV/markview.nvim',
    ft = 'markdown',
    dependencies = {
      'saghen/blink.cmp'
    },
  },

  {
    '3rd/diagram.nvim',
    dependencies = {
      '3rd/image.nvim',
    },
    ft = { 'markdown' },
    opts = {
      renderer_options = {
        mermaid = {
          background = 'transparent',
          theme = 'dark',
        },
        plantuml = {
          charset = 'utf-8',
        },
        d2 = {
          theme_id = 102,
          dark_theme_id = 200,
          layout = 'elk',
          sketch = false,
        },
      },
    },
  }
}
