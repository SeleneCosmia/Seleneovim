---@alias plugins.completion.opts "'blink'" | "'cmp'"

-- User defined variables ─────────────────────────────────────╼
vim.g.completion_plugin = 'blink' ---@type plugins.completion.opts
--  ╾──────────────────────────────────────────────────────────╼

-- stylua: ignore start
--  ╾──────────────────────────────────────────────────────────╼
vim.go.mousemodel           = 'popup'
vim.go.mousefocus           = true
--  ╾────────────────────────────────╼
vim.g.loaded_ruby_provider  = 0
vim.g.loaded_perl_provider  = 0
vim.g.node_host_prog        = os.getenv('NVM_BIN') .. '/neovim-node-host'
vim.g.python3_host_prog     = vim.fn.exepath('python3')

vim.g.editorconfig          = false
--  ╾──────────────────────────────────────────────────────────╼
-- stylua: ignore end
