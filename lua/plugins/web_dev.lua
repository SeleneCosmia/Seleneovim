local filetypes = require 'utils.globals'.filetypes.web_dev

---@type LazySpec[]
return {
  {
    'barrett-ruth/live-server.nvim',
    ft = filetypes,
    cmd = { 'LiveServerToggle' },
    config = true,
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
