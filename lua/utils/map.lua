local M = {}

---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
--- If mode is a list instead of a string ie:
--- ```lua
---     { 'n', 'i' }
--- ```
--- then you must add a `desc` and apped the table to the
--- **end** of the map function params
---@param mode? string|string[]
function M.map(lhs, rhs, opts, mode)
  mode = mode or 'n'
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
