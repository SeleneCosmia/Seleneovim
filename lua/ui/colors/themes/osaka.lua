local X = {}

---@param opts table
function X.setup(opts)
    local osaka = require 'solarized-osaka'
    opts = {
        transparent = false,
        terminal_colors = true,
        styles = {
            keywords = {},
            functions = { italic = true, bold = true },
            comments = { italic = false, bold = false },
        },
        sidebars = {
            "qf",
            "help",
            "neo-tree"
        },
        pairs = {
            { '{', '}' },
            { '(', ')' },
            { '<', '>' },
            { '[', ']' }
        }
    }
    osaka.setup(opts)
end

return X
