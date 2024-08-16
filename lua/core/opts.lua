local set, g, go = vim.opt, vim.g, vim.go
--stylua ignore:start
--  ╾──────────────────────────────────────────────────────────╼
local options = {
  clipboard         = 'unnamedplus',
  confirm           = true,

  wrap              = false,
  breakindent       = true,

  cursorline        = true,
  cursorlineopt     = 'both',

  completeopt       = {'menu','menuone'}, -- 'noselect'
--  cmdheight         = 0,

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
  tabstop           = 4,
  shiftwidth        = 2,
  softtabstop       = 2,
  smarttab          = true,
  smartindent       = true,
  autoindent        = true,
  shiftround        = true,

  list              = true,
  lcs               = { lead = nil, tab = nil, trail = '▹' },
  fillchars         = { eob = nil, vert = '🮍',  },

  signcolumn        = 'auto:1-2',
  number            = true,
  numberwidth       = 4,
  rnu               = false,

  pumheight         = 10,
  pumblend          = 0,

  wildmenu          = true,
  wildmode          = 'longest,list,full',
  wic               = true,
  conceallevel      = 1,

  splitbelow        = true,
  splitright        = true,
  splitkeep         = 'cursor',

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

go.mousemodel           = 'popup'
go.mousefocus           = true

for k, v in pairs(options) do
  vim.opt[k] = v
end


set.wildignore = {
  '*.directory',
}

--  ╾──────────────────────────────────────────────────────────╼
--stylua ignore:end
--
g.do_filetype_lua       = true
g.did_load_filetypes    = false
g.loaded_perl_provider  = 0

g.ruby_host_prog = os.getenv("XDG_DATA_HOME") .. "/gem/ruby/3.0.0/bin"

if vim.env.SHELL == "/bin/bash" then
    g.node_host_prog = os.getenv('NVM_BIN')
end
