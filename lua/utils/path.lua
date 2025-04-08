local Path = {}
Path.__index = Path

function Path:init()
  self.home = os.getenv('HOME')
  self.package_path = package.path
  self.package_cpath = package.cpath
  return self
end

function Path:append(new_path, pkg_name)
  pkg_name = pkg_name or nil

  if not self.package_path then
    self.package_path = self.package_path or package.path
  end

  if type(pkg_name) == 'nil' then
    new_path = new_path .. '/?.lua;' .. new_path .. '/?/init.lua;'
  else
    new_path = string.format('%s/%s/init.lua;', new_path, pkg_name)
  end
  self.package_path = self.package_path .. new_path
  package.path = self.package_path
end

function Path:reset()
  self.package_path = package.path
  package.path = self.package_path
end

return setmetatable(Path, {
  __call = function(cls)
    local instance = setmetatable({}, cls)
    return cls:init(instance)
  end,
})

-- local rocks_path  = '/luarocks/share/5.1/'
-- local luarocks    = config_home .. rocks_path

-- package.path = package.path
--   .. ';'
--   .. luarocks
--   .. '?/init.lua'
-- package.path = package.path
--   .. ';'
--   .. luarocks
--   .. '?.lua;'
