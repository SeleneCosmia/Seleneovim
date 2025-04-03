---@alias plugins.completion.opts "'blink'" | "'cmp'"

-- User defined variables ─────────────────────────────────────╼
vim.g.completion_plugin = 'blink' ---@type plugins.completion.opts


if os.getenv('TERM_PROGRAM') == 'WezTerm' then
  _G.terminal = 'wezterm'
else
  _G.terminal = os.getenv('TERM_PROGRAM')
end

---@alias config.global.terminal_program "'wezterm'"|"'ghostty'"|"'kitty'"|"'rio'"|"'contour'"|string?

---@type config.global.terminal_program
vim.g.terminal_program = terminal

--  ╾──────────────────────────────────────────────────────────╼
vim.g.editorconfig = false

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.node_host_prog = os.getenv('NVM_BIN') .. '/neovim-node-host'
vim.g.python3_host_prog = vim.fn.exepath('python3')
--  ╾──────────────────────────────────────────────────────────╼

return vim.g
