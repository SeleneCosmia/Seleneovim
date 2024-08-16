local cmp = require 'cmp'

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'TelescopePrompt' },
  callback = function()
    cmp.setup.buffer({ enabled = false })
  end,
  once = false
})
