local filetypes = {
  'html',
  'css',
  'postcss',
  'sass',
  'scss',
  'stylus',
  'sugarss',
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
}

---@type LazySpec[]
return {
  {
    'cjodo/convert.nvim',
    enabled = false,
    dependencies = 'MunifTanjim/nui.nvim',
    cmd = { 'ConvertFindCurrent', 'ConvertFindNext', 'ConvertAll' },
    keys = {
      { '<leader>cc', '<cmd>ConvertFindCurrent<cr>', desc = 'Find Convertable unit in the current line' },
      { '<leader>ca', '<cmd>ConvertAll<cr>', desc = '[C]onvert [A]ll of a specified unit' },
    },
  },

  {
    'barrett-ruth/live-server.nvim',
    ft = filetypes,
    cmd = { 'LiveServerToggle' },
    config = true,
  },

  {
    'ray-x/web-tools.nvim',
    ft = { 'html', 'css', 'javascript', 'typescript', 'sass', 'stylus' },
    cmd = { 'Npm', 'BrowserOpen', 'Npx', 'Pnpm' },
    config = function()
      require 'web-tools'.setup()
    end,
  },
}
