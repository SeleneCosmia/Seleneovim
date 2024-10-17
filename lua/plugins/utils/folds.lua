return {
  {
    'kevinhwang91/nvim-ufo',
    version = false,
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.opt.foldcolumn = '1'
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true

      local ufo = require 'ufo'
      ufo.setup({
        ---@diagnostic disable-next-line
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
      })
    end,
  },

  {
    'OXY2DEV/foldtext.nvim',
    lazy = false,
  },
}
