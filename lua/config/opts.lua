local o, opt, g, go = vim.o, vim.opt, vim.g, vim.go
--stylua ignore:start
--  ╾──────────────────────────────────────────────────────────╼
--      General Opts
--  ╾──────────────────────────────────────────────────────────╼
o.clipboard         = 'unnamedplus'         -- use system clipboard
o.wrap              = false                 -- turns off line wrapping
o.cursorline        = true
o.cursorlineopt     = 'both'
opt.completeopt     = {'menu','menuone','noselect'}
o.scrolloff         = 6                     -- number of rows 󰁝  and 󰁅  when scrolling
o.sidescroll        = 8                     -- minimum number of columns to scroll 
o.sidescrolloff     = 8                     -- number of columns 󰁍  and 󰁔  when scrolling
o.scrolljump        = 8
o.confirm           = true
opt.virtualedit     = {'block'}             -- allows cursor to move into empty space in visual block mode
o.backspace         = 'indent,eol,start'
o.updatetime        = 250
o.timeoutlen        = 300
--  ╾──────────────────────────────────────────────────────────╼
--      Mouse Opts
--  ╾──────────────────────────────────────────────────────────╼
o.mouse             = 'a'                   -- enable mouse in all modes
go.mousemodel       = 'popup'
go.mousefocus       = true                  -- window focus follows mouse
--  ╾──────────────────────────────────────────────────────────╼
--      Indentation Opts
--  ╾──────────────────────────────────────────────────────────╼
o.expandtab         = true
o.tabstop           = 4                     -- see `:help tabstop` for why I chose these opts
o.shiftwidth        = 4                     -- how many spaces ">>" and "<<" use
o.softtabstop       = 4
o.smarttab          = true
o.smartindent       = true
o.autoindent        = true
o.shiftround        = true
--  ╾──────────────────────────────────────────────────────────╼
--      Display Opts
--  ╾──────────────────────────────────────────────────────────╼
o.fillchars         = 'eob: '               -- removes "~" for empty lines @ the end of a buffer 
o.listchars         = 'tab:  '
o.winbl             = 0
o.signcolumn        = "yes"                 -- always show sign column
o.number            = true                  -- turn on line numbering
o.numberwidth       = 4                     -- gutter width (default is 4)
o.rnu               = false                 -- don't show relative numbers
o.pumheight         = 12
o.pumblend          = 0
o.wildmenu          = true
o.wildmode          = 'list:longest,list:full'
o.wic               = true
o.conceallevel      = 1
--  ╾──────────────────────────────────────────────────────────╼
--      Splits & Buffer Opts
--  ╾──────────────────────────────────────────────────────────╼
o.splitbelow        = true                  -- 󰤻 splits always open on the 󰞖  current window
o.splitright        = true                  -- 󰤼 splits always open to the  󰞘  of current window
--  ╾──────────────────────────────────────────────────────────╼
--      File Opts
--  ╾──────────────────────────────────────────────────────────╼
o.swapfile          = false                 -- disables swap file
o.undofile          = true                  -- enable persistent undo
o.undolevels        = 3000
o.backup            = false                 -- disables backup file
--  ╾──────────────────────────────────────────────────────────╼
--      Search Opts
--  ╾──────────────────────────────────────────────────────────╼
o.hlsearch          = true                 -- highlight all matches of search pattern
o.ignorecase        = true                  -- ignore case while searching
o.smartcase         = true                  -- ignore case unless search contains /C or capital letter(s)
o.infercase         = true
--  ╾──────────────────────────────────────────────────────────╼
--      Statusline Opts
--  ╾──────────────────────────────────────────────────────────╼
o.showmode          = false
o.showtabline       = 2                     -- always show the tabline/bufferline
o.laststatus        = 3                     -- global statusline
--  ╾──────────────────────────────────────────────────────────╼
--      Filetype Opts
--  ╾──────────────────────────────────────────────────────────╼
g.do_filetype_lua            = true
--g.markdown_recommended_style = 0

--------------------------------
--stylua ignore:end
g.loaded_perl_provider = 0

g.ruby_host_prog = os.getenv("XDG_DATA_HOME") .. "/gem/ruby/3.0.0/bin"

if os.getenv("SHELL") == "/bin/bash" then
    g.node_host_prog = os.getenv('NVM_BIN')
end
