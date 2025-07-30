---@class Path
local Path = {}

---@return Path
function Path:init()
  self.home = os.getenv('HOME')
  self.package_path = package.path
  self.__index = self
  return setmetatable(self, Path)
end

function Path:append(new_path, pkg_name)
  pkg_name = pkg_name or nil

  -- if type(self.package_path) == 'nil' then
  --   self.package_path = package.path
  -- end

  if type(pkg_name) == 'nil' then
    new_path = new_path .. '/?.lua;' .. new_path .. '/?/init.lua;'
  else
    new_path = string.format('%s/%s/init.lua;', new_path, pkg_name)
  end

  self.package_path = self.package_path .. new_path
end

function Path:prepend(new_path, pkg_name)

end

---@return string
function Path:get()
  return self.package_path
end

function Path:reset()
  self.package_path = package.path
end

return setmetatable(Path, {
  __call = function(_)
    return Path:init()
  end,
  __tostring = function(_)
    return Path:get()
  end
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
