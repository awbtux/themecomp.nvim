local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        WhichKey            = { fg = col30.blue, ctermfg = 4 },
        WhichKeySeparator   = { fg = col30.light_grey, ctermfg = 8 },
        WhichKeyDesc        = { fg = col30.red, ctermfg = 1 },
        WhichKeyGroup       = { fg = col30.green, ctermfg = 2 },
        WhichKeyValue       = { fg = col30.green, ctermfg = 2 },
    }
end

return M
