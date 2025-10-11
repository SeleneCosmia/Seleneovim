local set_cursor = vim.api.nvim_win_set_cursor
local get_cursor = vim.api.nvim_win_get_cursor(0)

local M = {}

---@alias vars.set "'cursor'"|"'text'"
---@alias vars.get "'buf'"|"'cursor'"|"'win'"

---@param var vars.get
function M.get(var)
  local cmd = nil
  if var == 'buf' then
    cmd = vim.api.nvim_get_current_buf()
  end
  if var == 'cursor' then
    cmd = vim.api.nvim_win_get_cursor(0)
  end
  if var == 'win' then
    cmd = vim.api.nvim_get_current_win()
  end
  return cmd
end

function M.decorate_comment()
  local popup = require 'nui.popup'
  local menu = require 'nui.menu'
  local input = require 'nui.input'
end

return M
