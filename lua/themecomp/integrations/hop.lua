local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        HopNextKey  = { fg = col30.red, ctermfg = 1, bold = true },
        HopNextKey1 = { fg = col30.cyan, ctermfg = 6, bold = true },
        HopNextKey2 = { fg = col30.blue, ctermfg = 4, bold = true },
    }
end

return M
