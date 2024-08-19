vim.g.mapleader = ' '
vim.g.maplocalleader = '/'

require 'core'
require 'utils.autocmds'
require 'lsp.settings.diagnostics'
require 'lsp.init'.setup()
