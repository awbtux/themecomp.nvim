local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        NotifyERRORBorder   = { fg = col30.red, ctermfg = 1 },
        NotifyERRORIcon     = { fg = col30.red, ctermfg = 1 },
        NotifyERRORTitle    = { fg = col30.red, ctermfg = 1 },
        NotifyWARNBorder    = { fg = col30.orange, ctermfg = 3 },
        NotifyWARNIcon      = { fg = col30.orange, ctermfg = 3 },
        NotifyWARNTitle     = { fg = col30.orange, ctermfg = 3 },
        NotifyINFOBorder    = { fg = col30.green, ctermfg = 2 },
        NotifyINFOIcon      = { fg = col30.green, ctermfg = 2 },
        NotifyINFOTitle     = { fg = col30.green, ctermfg = 2 },
        NotifyDEBUGBorder   = { fg = col30.grey, ctermfg = 8 },
        NotifyDEBUGIcon     = { fg = col30.grey, ctermfg = 8 },
        NotifyDEBUGTitle    = { fg = col30.grey, ctermfg = 8 },
        NotifyTRACEBorder   = { fg = col30.purple, ctermfg = 5 },
        NotifyTRACEIcon     = { fg = col30.purple, ctermfg = 5 },
        NotifyTRACETitle    = { fg = col30.purple, ctermfg = 5 },
    }
end

return M
