vim.g.mapleader = ' '

require 'core.lazy'
require 'config'
require 'utils.autocmds'
require 'lsp.settings.diagnostics'.signs()
require 'lsp.init'.setup()

