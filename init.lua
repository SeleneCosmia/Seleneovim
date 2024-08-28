vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require 'core'
require 'lsp.settings.diagnostics'
require 'lsp.init'.setup()
