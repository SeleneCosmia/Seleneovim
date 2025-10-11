vim.loader.enable()

package.path = package.path
  .. ';'
  .. (vim.fn.expand('$HOME') .. '/.config/luarocks/share/lua/5.1/?/init.lua;')
  .. (vim.fn.expand('$HOME') .. '/.config/luarocks/share/lua/5.1/?.lua;')

require 'core'
require 'lsp'

vim.cmd.colorscheme 'darkearth'
