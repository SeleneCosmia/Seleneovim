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
