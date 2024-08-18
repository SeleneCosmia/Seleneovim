local hl = require 'utils.globals'.hl
local aucmd = vim.api.nvim_create_autocmd

return {
  aucmd({ 'ColorScheme' }, {
    callback = function()
      hl(0, 'CmpItemKindText', { link = '@text.title' })
      hl(0, 'CmpItemKindField', { link = '@field' })
      hl(0, 'CmpItemKindEvent', { link = '@lsp.event' })
      hl(0, 'CmpItemKindStruct', { link = '@lsp.type.struct' })
      hl(0, 'CmpItemKindProperty', { link = '@reference' })
      hl(0, 'CmpItemKindInterface', { link = '@lsp.type.interface' })

      hl(0, 'CmpItemKindEnum', { link = '@lsp.type.enum' })
      hl(0, 'CmpItemKindEnumMember', { link = '@lsp.type.enumMember' })
      hl(0, 'CmpItemKindEnumDefault', { link = '@lsp.type.enum' })
      hl(0, 'CmpItemKindEnumMemberDefault', { link = '@lsp.type.enumMember' })

      hl(0, 'CmpItemKindConstant', { link = '@constant' })
      hl(0, 'CmpItemKindConstructor', { link = '@constructor' })
      hl(0, 'CmpItemKindReference', { link = '@reference' })

      hl(0, 'CmpItemKindClass', { link = '@lsp.type.class' })
      hl(0, 'CmpItemKindModule', { link = '@string.regex' })

      hl(0, 'CmpItemKindVariable', { link = '@lsp.type.variable' })
      hl(0, 'CmpItemKindFile', { link = '@punctuation' })
      hl(0, 'CmpItemKindFolder', { link = '@define' })

      hl(0, 'CmpItemKindSnippet', { link = '@lsp.type.magicFunction' })
      hl(0, 'CmpItemKindSnippetDefault', { link = '@lsp.type.magicFunction' })

      hl(0, 'CmpItemKindOperator', { link = '@operator' })
      hl(0, 'CmpItemKindMethod', { link = '@method' })
      hl(0, 'CmpItemKindValue', { link = '@number' })
      hl(0, 'CmpItemKindUnit', { link = '@number' })

      hl(0, 'CmpItemKindColor', { link = '@punctuation.special' })
      hl(0, 'CmpItemKindColorDefault', { link = '@punctuation.special' })
      hl(0, 'CmpItemKindTypeParameter', { link = '@lsp.type.typeParameter' })

      hl(0, 'CmpItemKindKeyword', { link = '@keyword' })
      hl(0, 'CmpItemKindKeywordDefault', { link = '@keyword' })
    end,
  }),
}
