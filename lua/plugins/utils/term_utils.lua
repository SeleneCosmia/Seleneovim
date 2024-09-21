return {
  -- ╓─────────────────────────────────────────────────────────╖
  -- ║               Terminal Specific Plugin(s)               ║
  -- ╙─────────────────────────────────────────────────────────╜
  {
    'RAprogramm/nekifoch',
    cmd = 'Nekifoch',
    cond = function()
      if os.getenv('TERM') == 'xterm-kitty' then
        return true
      else
        return false
      end
    end,
    opts = {},
  },
-- ╓─────────────────────────────────────────────────────────╖
-- ║                Neovim Terminal Plugin(s)                ║
-- ╙─────────────────────────────────────────────────────────╜
  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    version = '*',
    opts = {},
  },
}
