local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        AlphaHeader  = { fg = col30.grey_fg, ctermfg = 8 },
        AlphaButtons = { fg = col30.light_grey, ctermfg = 8 },
    }
end

return M
