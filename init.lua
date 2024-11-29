vim.loader.enable()

package.path = package.path .. vim.fn.expand('$XDG_CONFIG_HOME') .. '/luarocks/share/lua/5.1/?/init.lua'
package.path = package.path .. vim.fn.expand('$XDG_CONFIG_HOME') .. '/luarocks/share/lua/5.1/?.lua'

require 'core'
require 'lsp.settings.diagnostics'
