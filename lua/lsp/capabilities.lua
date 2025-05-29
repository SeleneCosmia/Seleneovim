local M = {}

local function make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }

  capabilities.textDocument.completion.completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      },
    },
    documentationFormat = { 'markdown', 'plaintext' },
  }

  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  return require 'blink-cmp'.get_lsp_capabilities(capabilities, true)
end

return { make_capabilities = make_capabilities  }
