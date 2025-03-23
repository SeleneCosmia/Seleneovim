---@type LazySpec[]
return {
  {
    '3rd/image.nvim',
    ft = { 'markdown', 'noice', 'cmp_docs', 'blink-cmp-documentation' },
    ---@module 'image'
    ---@type Options
    opts = {
      backend = 'kitty',
      processor = 'magick_cli',
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          floating_windows = true,
          filetypes = {
            'markdown',
            'noice',
            'cmp_docs',
            'blink-cmp-documentation',
          },
        },
        neorg = { enabled = false },
        typst = { enabled = false },
        html = { enabled = false },
        css = { enabled = false },
      },
      max_width = 80,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
      window_overlap_clear_ft_ignore = {
        'blink-cmp-documentation',
        'blink-cmp-menu',
        'cmp_docs',
        'cmp_menu',
        '',
      },
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
      hijack_file_patterns = {
        '*.png',
        '*.bmp',
        '*.jpg',
        '*.jpeg',
        '*.jxl',
        '*.gif',
        '*.webp',
        '*.avif',
        '*.heic',
        '*.xpm',
        '*.ico',
        '*.pdf',
      },
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
  },

  {
    'OXY2DEV/helpview.nvim',
    ft = 'help',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },

  {
    'echasnovski/mini.misc',
    version = false,
    config = function()
      require 'mini.misc'.setup()
      MiniMisc.setup_termbg_sync()
    end,
  },

  -- {
  --   'rachartier/tiny-glimmer.nvim',
  --   event = 'VeryLazy',
  --   opts = {}
  -- }
}
