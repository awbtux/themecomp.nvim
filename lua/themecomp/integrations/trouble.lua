local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        TroubleCount            = { fg = col30.pink, ctermfg = 13 },
        TroubleCode             = { fg = col30.white, ctermfg = 7 },
        TroubleWarning          = { fg = col30.orange, ctermfg = 3 },
        TroubleSignWarning      = { link = "DiagnosticWarn" },
        TroubleTextWarning      = { fg = col30.white, ctermfg = 7 },
        TroublePreview          = { fg = col30.red, ctermfg = 1 },
        TroubleSource           = { fg = col30.cyan, ctermfg = 14 },
        TroubleSignHint         = { link = "DiagnosticHint" },
        TroubleTextHint         = { fg = col30.white, ctermfg = 7 },
        TroubleHint             = { fg = col30.orange, ctermfg = 3 },
        TroubleSignOther        = { link = "DiagnosticNormal" },
        TroubleSignInformation  = { fg = col30.white, ctermfg = 7 },
        TroubleTextInformation  = { fg = col30.white, ctermfg = 7 },
        TroubleInformation      = { fg = col30.white, ctermfg = 7 },
        TroubleError            = { fg = col30.red, ctermfg = 1 },
        TroubleTextError        = { fg = col30.white, ctermfg = 7 },
        TroubleSignError        = { link = "DiagnosticError" },
        TroubleText             = { fg = col30.white, ctermfg = 7 },
        TroubleFile             = { fg = col30.yellow, ctermfg = 7 },
        TroubleFoldIcon         = { link = "Folded" },
        TroubleNormal           = { fg = col30.white, ctermfg = 7 },
        TroubleLocation         = { fg = col30.red, ctermfg = 1 },
        TroubleIndent           = { link = col30.Comment },
    }
end

return M
