vim.loader.enable()

-- vim.opt.rtp:append(vim.fn.expand('$XDG_CONFIG_HOME') .. '/luarocks/share/lua/5.1/?/init.lua')
-- vim.opt.rtp:append(vim.fn.expand('$XDG_CONFIG_HOME') .. '/luarocks/share/lua/5.1/?.lua')

require 'core'
require 'lsp.settings.diagnostics'
