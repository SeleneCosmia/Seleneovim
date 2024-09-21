local lspconfig = require 'lspconfig'
local util      = lspconfig.util
local jbin      = '$XDG_DATA_HOME' ..
                  '/julia/environments/nvim-lspconfig/bin/julia'

---@param setup lspconfig.options.julials
return function(setup)
  setup = {
    on_new_config = function(new_config, _)
      local julia = vim.fs.normalize(jbin)
      if util.path.is_file(julia) then
        new_config.cmd[1] = julia
      end
    end,
  }
  return lspconfig.julials.setup(setup)
end
