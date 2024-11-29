local opt, g, go = vim.opt, vim.g, vim.go
-- stylua: ignore start
--  ╾──────────────────────────────────────────────────────────╼
local options = {
  exrc              = true,

  clipboard         = 'unnamedplus',
  confirm           = true,

  wrap              = false,
  breakindent       = true,

  completeopt       = {'menu','menuone'}, -- 'noselect'

  scrolloff         = 8,
  sidescroll        = 6,
  sidescrolloff     = 12,
  scrolljump        = 8,
  wrapscan          = true, -- wrap searches back to beginning

  virtualedit       = {'block'},
  backspace         = 'indent,eol,start',

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

  number            = true,
  rnu               = true,

  pumheight         = 10,
  pumblend          = 0,

  wildmenu          = true,
  wildmode          = 'longest,list,full',
  wic               = true,
  conceallevel      = 1,

  splitbelow        = true,
  splitright        = true,
  splitkeep         = 'cursor',
  title             = true,

  swapfile          = false,
  undofile          = true,
  undolevels        = 3000,
  backup            = false,

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
  opt[k] = v
end

opt.listchars = {
  lead = nil,
  tab = '••',
  trail = '⬧',
}

opt.wildignore = { '.directory' }

--  ╾──────────────────────────────────────────────────────────╼
go.mousemodel           = 'popup'
go.mousefocus           = true
--  ╾────────────────────────────────╼
g.do_filetype_lua       = true
g.did_load_filetypes    = false
g.loaded_perl_provider  = 0
g.loaded_ruby_provider  = 0
--  ╾──────────────────────────────────────────────────────────╼
-- stylua: ignore end
--

if vim.env.SHELL == '/bin/bash' then
  g.node_host_prog = os.getenv('NVM_BIN') .. '/neovim-node-host'
end
