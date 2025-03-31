vim.wo.nu = true

vim.o.termguicolors = true

vim.opt.listchars = {
  lead = nil,
  tab = '••',
  trail = '⬧',
}

vim.opt.wildignore:append { '.directory', '.github', '.git', 'node_modules' }

-- stylua: ignore start
--  ╾──────────────────────────────────────────────────────────╼
local options = {
  autoindent        = true,
  backspace         = {'indent','eol','start'},
  backup            = false,
  breakindent       = true,
  clipboard         = 'unnamedplus',
  completeopt       = {'menu','menuone','preview'},
  conceallevel      = 1,
  confirm           = true,
  cursorline        = true,
  cursorlineopt     = {'number','screenline'},
  expandtab         = true,
  exrc              = true,
  fillchars         = { eob = ' ' },
  hlsearch          = true,
  ignorecase        = true,
  infercase         = true,
  laststatus        = 3,
  list              = true,
  mouse             = 'a',
  mousemoveevent    = true,
  mousescroll       = { 'ver:1', 'hor:6' },
  pumblend          = 0,
  pumheight         = 10,
  scrolljump        = 8,
  scrolloff         = 8,
  shiftwidth        = 2,
  showmode          = false,
  showtabline       = 0,
  sidescroll        = 6,
  sidescrolloff     = 12,
  smartcase         = true,
  smartindent       = true,
  softtabstop       = 2,
  splitbelow        = true,
  splitkeep         = 'cursor',
  splitright        = true,
  swapfile          = false,
  tabstop           = 2,
  timeout           = true,
  timeoutlen        = 500,
  title             = true,
  undofile          = true,
  undolevels        = 3000,
  updatetime        = 300,
  virtualedit       = {'block'},
  wic               = true,
  wildmenu          = true,
  wildmode          = {'longest','list','full'},
  wrap              = false,
  wrapscan          = true,
}
-- stylua: ignore end
for k, v in pairs(options) do
  vim.opt[k] = v
end
