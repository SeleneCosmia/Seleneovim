local config_home = vim.fn.expand('$XDG_CONFIG_HOME')
local rocks_path  = '/luarocks/share/5.1/'
local luarocks    = config_home .. rocks_path

package.path = package.path
  .. ';'
  .. luarocks
  .. '?/init.lua'
package.path = package.path
  .. ';'
  .. luarocks
  .. '?.lua;'
