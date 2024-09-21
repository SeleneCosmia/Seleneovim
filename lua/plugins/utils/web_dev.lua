return {
  {
    'cjodo/convert.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    cmd = { 'ConvertFindCurrent', 'ConvertFindNext', 'ConvertAll' },
    keys = {
      { '<leader>cc', '<cmd>ConvertFindCurrent<cr>', desc = 'Find Convertable unit in the current line' },
      { '<leader>ca', '<cmd>ConvertAll<cr>', desc = '[C]onvert [A]ll of a specified unit' },
    }
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
