local autocmd = vim.api.nvim_create_autocmd
local events  = { 'BufNewFile', 'BufRead' }

local dirs = {
  bash = {
    vim.fn.expand('$XDG_CONFIG_HOME') .. 'bash/.*/*',
    vim.fn.expand('$XDG_DATA_HOME') .. '/bash-completion/completions/*',
    '.*/bash/*.bash',
  },
}

autocmd(events, {
  pattern = dirs.bash,
  callback = function()
    vim.cmd.setfiletype 'sh'
  end,
})

vim.filetype.add({
  pattern = {
    ['.*/hypr%.d/.*%.conf'] = 'hyprlang',
    ['.*/hyprland%.conf']   = 'hyprlang',
  },
})
