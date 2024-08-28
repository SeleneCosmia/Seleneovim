local function lazy_setup()
  local lazy = require 'core.lazy'
    lazy.lazy_boot()
    lazy.lazy_setup()
  return lazy
end

lazy_setup()
require 'core.options'
require 'core.highlights'
require 'core.autocmds'
