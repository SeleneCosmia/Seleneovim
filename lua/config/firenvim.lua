local X = {}

---@param status boolean
X.firenvim_config = function(status)
    if vim.g.started_by_firenvim then
        status = true
    elseif not vim.g.started_by_firenvim then
        status = false
    end
    return status
end
