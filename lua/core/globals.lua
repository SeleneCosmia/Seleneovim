local terminal = os.getenv('TERM_PROGRAM')
if os.getenv('TERM_PROGRAM') == 'WezTerm' then
  terminal = 'wezterm'
end

local globals = {
  terminal = terminal,
}

for name, value in pairs(globals) do
  vim.g[name] = value
end

vim.g.border = 'rounded'
vim.g.editorconfig_enable = false

-- Plugins
vim.g.loaded_matchparen = 1
vim.g.netrw_nogx = 1
vim.g.suda_smart_edit = 1

-- Language Providers + Programs
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_pythonx_provider = 0

vim.g.node_host_prog = os.getenv('NVM_BIN') .. '/neovim-node-host'
vim.g.python3_host_prog = vim.fn.exepath('python3')

-- Mouse config
vim.go.mousemodel = 'popup'
vim.go.mousefocus = true
