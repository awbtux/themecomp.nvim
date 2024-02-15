local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        -- LSP References
        LspReferenceText    = { fg = col30.darker_black, ctermfg = 0, bg = col30.white, ctermbg = 7 },
        LspReferenceRead    = { fg = col30.darker_black, ctermfg = 0, bg = col30.white, ctermbg = 7 },
        LspReferenceWrite   = { fg = col30.darker_black, ctermfg = 0, bg = col30.white, ctermbg = 7 },

        -- Lsp Diagnostics
        DiagnosticHint              = { fg = col30.purple, ctermfg = 5 },
        DiagnosticError             = { fg = col30.red, ctermfg = 1 },
        DiagnosticWarn              = { fg = col30.yellow, ctermfg = 11 },
        DiagnosticInformation       = { fg = col30.green, ctermfg = 2 },
        LspSignatureActiveParameter = { fg = col30.black, ctermfg = 0, bg = col30.green, ctermbg = 2 },

        RenamerTitle    = { fg = col30.black, bg = col30.red, ctermfg = 0, ctermbg = 1  },
        RenamerBorder   = { fg = col30.red, ctermfg = 1 },
    }
end

return M
