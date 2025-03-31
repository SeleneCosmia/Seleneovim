---@alias plugins.completion.opts "'blink'" | "'cmp'"

-- User defined variables ─────────────────────────────────────╼
vim.g.completion_plugin = 'blink' ---@type plugins.completion.opts

local function get_current_terminal()
  local term_name = os.getenv('TERM_PROGRAM')

  if term_name == 'WezTerm' then
    vim.g.terminal_program = 'wezterm'
  else
    vim.g.terminal_program = term_name
  end
end

get_current_terminal()
--  ╾──────────────────────────────────────────────────────────╼
vim.g.editorconfig = false

vim.go.mousemodel = 'popup'
vim.go.mousefocus = true

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.node_host_prog = os.getenv('NVM_BIN') .. '/neovim-node-host'
vim.g.python3_host_prog = vim.fn.exepath('python3')
--  ╾──────────────────────────────────────────────────────────╼
