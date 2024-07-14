vim.g.mapleader = ' '

require 'core'
require 'utils.autocmds'
require 'lsp.settings.diagnostics'.signs()
require 'lsp.init'.setup()
