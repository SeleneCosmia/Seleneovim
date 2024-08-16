local aucmd = vim.api.nvim_create_autocmd

aucmd({ 'BufNewFile', 'BufRead' }, {
  pattern = {'*.sss'},
  callback = function()
    vim.filetype.add {
      extension = {
        sss = 'sugarss'
      },
    }
    vim.cmd.setfiletype 'stylus'
  end,
})
