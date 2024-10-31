vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require 'core'
require 'lsp.settings.diagnostics'
require 'lsp.init'.setup()

package.path = package.path .. vim.fn.expand('$XDG_CONFIG_HOME') .. '/luarocks/share/lua/5.1/?/init.lua;'
package.path = package.path .. vim.fn.expand('$XDG_CONFIG_HOME') .. '/luarocks/share/lua/5.1/?.lua;'
