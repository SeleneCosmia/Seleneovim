local devicon_colors = require 'tiny-devicons-auto-colors'
return {
  devicon_colors.setup({
    cache = {
      enabled = true,
      path = vim.fn.stdpath('cache') .. '/devicon-auto-colors-cache.json',
    },

    precise_search = {
      enabled = true,
      iteration = 10,
      precision = 22,
      threshold = 24,
    },

    autoreload = true,
  }),
}
