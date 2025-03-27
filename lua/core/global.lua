local home = os.getenv('HOME')
local config_home = os.getenv('XDG_CONFIG_HOME')

local global = {}

function global:load_variables()
  self.os = 'linux'
  self.config_path = home .. '/.config/nvim'
  self.cache_path = home .. '/.cache/nvim'
  self.lazy_path = home .. '/.local/share/nvim/lazy'
  self.mason_path = home .. '/.local/share/nvim/mason'
  self.module_path = self.config_path .. '/lua'
  self.rocks_path = config_home .. '/luarocks/share/lua/5.1'
  self.home = home
end

global:load_variables()

return global
