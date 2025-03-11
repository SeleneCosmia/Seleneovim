local aucmd = vim.api.nvim_create_autocmd

aucmd({'BufRead', 'BufNewFile'}, {
  pattern = '*.sss',
  callback = function()
    vim.filetype.add({
      extension = { sss = 'sugarss' }
    })
    vim.cmd.setfiletype 'sugarss'
  end,
})
