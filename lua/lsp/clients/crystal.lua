local lspconfig     = require('lspconfig')
local null_ls       = require('null-ls')
local ameba         = require('efmls-configs.linters.ameba')

local formatting = null_ls.builtins.formatting

local sources = { formatting.crystal_format }

