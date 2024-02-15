local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        RainbowDelimiterRed     = { fg = col30.red, ctermfg = 1 },
        RainbowDelimiterYellow  = { fg = col30.yellow, ctermfg = 11 },
        RainbowDelimiterBlue    = { fg = col30.blue, ctermfg = 4 },
        RainbowDelimiterOrange  = { fg = col30.orange, ctermfg = 3 },
        RainbowDelimiterGreen   = { fg = col30.green, ctermfg = 2 },
        RainbowDelimiterViolet  = { fg = col30.purple, ctermfg = 5 },
        RainbowDelimiterCyan    = { fg = col30.cyan, ctermfg = 6 },
    }
end

return M
