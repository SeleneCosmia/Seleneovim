local filetypes = require 'utils.globals'.filetypes.web_dev

---@type LazySpec[]
return {
  {
    url = 'https://git.barrettruth.com/barrettruth/live-server.nvim',
    ft = filetypes,
  },

  {
    'ray-x/web-tools.nvim',
    ft = filetypes,
    cmd = { 'Npm', 'BrowserOpen', 'Npx', 'Pnpm' },
    config = function()
      require 'web-tools'.setup()
    end,
  },
}
