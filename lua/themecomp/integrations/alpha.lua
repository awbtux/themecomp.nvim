local M = {}

function M.set(col16, col30)
    return {
        AlphaHeader =   { fg = col30.grey_fg, ctermfg = 8 },
        AlphaButtons =  { fg = col30.light_grey, ctermfg = 8 },
    }
end

return M
