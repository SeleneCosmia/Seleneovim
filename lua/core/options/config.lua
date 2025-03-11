vim.wo.nu = true

vim.o.termguicolors = true

vim.opt.listchars = {
  lead = nil,
  tab = '••',
  trail = '⬧',
}

vim.opt.wildignore:append { '.directory' }

-- stylua: ignore start
--  ╾──────────────────────────────────────────────────────────╼
local options = {
  exrc              = true,

  clipboard         = 'unnamedplus',
  confirm           = true,

  wrap              = false,
  breakindent       = true,

  completeopt       = {'menu','menuone','preview'}, -- 'noselect'

  scrolloff         = 8,
  sidescroll        = 6,
  sidescrolloff     = 12,
  scrolljump        = 8,
  wrapscan          = true,

  virtualedit       = {'block'},
  backspace         = {'indent','eol','start'},

  updatetime        = 300,
  timeout           = true,
  timeoutlen        = 500,

  expandtab         = true,
  tabstop           = 2,
  shiftwidth        = 2,
  softtabstop       = 2,
  smartindent       = true,
  autoindent        = true,

  list              = true,
  fillchars         = { eob = ' ' },

  cursorline        = true,
  cursorlineopt     = {'number','screenline'},

  pumheight         = 10,
  pumblend          = 0,

  wildmenu          = true,
  wildmode          = {'longest','list','full'},
  wic               = true,
  conceallevel      = 1,

  splitbelow        = true,
  splitright        = true,
  splitkeep         = 'cursor',
  title             = true,

  backup            = false,
  swapfile          = false,
  undofile          = true,
  undolevels        = 3000,

  hlsearch          = true,
  ignorecase        = true,
  smartcase         = true,
  infercase         = true,

  showmode          = false,
  showtabline       = 0,
  laststatus        = 3,

  mouse             = 'a',
  mousemoveevent    = true,
  mousescroll       = { 'ver:1', 'hor:6' }
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--  ╾──────────────────────────────────────────────────────────╼
vim.go.mousemodel           = 'popup'
vim.go.mousefocus           = true
--  ╾──────────────────────────────────────────────────────────╼
-- stylua: ignore end
--

if vim.env.SHELL == '/bin/bash' then
  vim.g.node_host_prog = os.getenv('NVM_BIN') .. '/neovim-node-host'
end
