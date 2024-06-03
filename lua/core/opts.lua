local o, opt, g, go = vim.o, vim.opt, vim.g, vim.go
--stylua ignore:start

o.clipboard         = 'unnamedplus'
o.wrap              = false
o.cursorline        = true
o.cursorlineopt     = 'both'
opt.completeopt     = {'menu','menuone','noselect'}
o.scrolloff         = 6
o.sidescroll        = 8
o.sidescrolloff     = 8
o.scrolljump        = 8
o.confirm           = true
opt.virtualedit     = {'block'}
o.backspace         = 'indent,eol,start'
o.updatetime        = 250
o.timeoutlen        = 300
--  ╾──────────────────────────────────────────────────────────╼
--      Mouse Opts
--  ╾──────────────────────────────────────────────────────────╼
o.mouse             = 'a'
go.mousemodel       = 'popup'
go.mousefocus       = true
--  ╾──────────────────────────────────────────────────────────╼
--      Indentation Opts
--  ╾──────────────────────────────────────────────────────────╼
o.expandtab         = true
o.tabstop           = 4
o.shiftwidth        = 4
o.softtabstop       = 4
o.smarttab          = true
o.smartindent       = true
o.autoindent        = true
o.shiftround        = true
--  ╾──────────────────────────────────────────────────────────╼
--      Display Opts
--  ╾──────────────────────────────────────────────────────────╼
o.fillchars         = 'eob: '
opt.list            = true
--  ╾──────────────────────────────────────────────────────────╼
o.winbl             = 0
o.signcolumn        = "yes"
o.number            = true
o.numberwidth       = 4
o.rnu               = false
o.pumheight         = 12
o.pumblend          = 0
o.wildmenu          = true
o.wildmode          = 'list:longest,list:full'
o.wic               = true
o.conceallevel      = 1
--  ╾──────────────────────────────────────────────────────────╼
o.splitbelow        = true
o.splitright        = true
--  ╾──────────────────────────────────────────────────────────╼
o.swapfile          = false
o.undofile          = true
o.undolevels        = 3000
o.backup            = false
--  ╾──────────────────────────────────────────────────────────╼
o.hlsearch          = true
o.ignorecase        = true
o.smartcase         = true
o.infercase         = true
--  ╾──────────────────────────────────────────────────────────╼
--      Statusline Opts
--  ╾──────────────────────────────────────────────────────────╼
o.showmode          = false
o.showtabline       = 2
o.laststatus        = 3
--  ╾──────────────────────────────────────────────────────────╼
g.do_filetype_lua   = true
--  ╾──────────────────────────────────────────────────────────╼
vim.opt.listchars:prepend 'lead:󿠍'
vim.opt.listchars = vim.opt.listchars + 'tab:  '
--------------------------------
--stylua ignore:end
g.loaded_perl_provider = 0

g.ruby_host_prog = os.getenv("XDG_DATA_HOME") .. "/gem/ruby/3.0.0/bin"

if os.getenv("SHELL") == "/bin/bash" then
    g.node_host_prog = os.getenv('NVM_BIN')
end
