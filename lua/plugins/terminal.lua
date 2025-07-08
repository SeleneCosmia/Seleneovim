-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                 Terminal Related Utils                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

return {
  {
    'RAprogramm/nekifoch',
    cmd = 'Nekifoch',
    cond = function(c)
      c = false
      if os.getenv('TERM') == 'xterm-kitty' then
        c = true
      end
      return c
    end,
    opts = {},
  },

  {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    opts = {},
  },
}
