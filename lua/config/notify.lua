local notify = require 'notify'

local min_width = function()
  return math.floor(vim.api.nvim_win_get_width(0) * 0.25)
end

local max_width = function()
  return math.ceil(vim.api.nvim_win_get_width(0) * 0.345)
end

return {
  notify.setup({
    background_colour = '#1D2021',
    minimum_width = min_width(),
    max_width = max_width(),
    stages = 'slide',
    timeout = 6000,
  }),
}
