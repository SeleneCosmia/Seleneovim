local command = function(lhs, rhs, opts)
  opts = vim.tbl_extend('force', opts, {})
  vim.api.nvim_create_user_command(lhs, rhs, opts)
end

command('Wq', 'wq', { bang = true, desc = 'Mistyped :wq cmd' })
command('W', 'w', { bang = true, desc = 'Mistyped :w cmd' })
command('Q', 'q', { bang = true, desc = 'Mistyped :q cmd' })
command('Wqa', 'wqa', { bang = true, desc = 'Mistyped :wqa cmd' })
command('Qa', 'qa', { bang = true, desc = 'Mistyped :qa cmd' })
