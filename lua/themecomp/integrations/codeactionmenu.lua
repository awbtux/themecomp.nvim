local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        CodeActionMenuWarningMessageText    = { fg = col30.white, ctermfg = 7 },
        CodeActionMenuWarningMessageBorder  = { fg = col30.red, ctermfg = 1 },
        CodeActionMenuMenuIndex             = { fg = col30.blue, ctermfg = 4 },
        CodeActionMenuMenuKind              = { fg = col30.green, ctermfg = 2 },
        CodeActionMenuMenuTitle             = { fg = col30.white, ctermfg = 15 },
        CodeActionMenuMenuDisabled          = { link = "Comment" },
        CodeActionMenuMenuSelection         = { fg = col30.blue, ctermfg = 4 },
        CodeActionMenuDetailsTitle          = { fg = col30.white, ctermfg = 15 },
        CodeActionMenuDetailsLabel          = { fg = col30.yellow, ctermfg = 3 },
        CodeActionMenuDetailsPreferred      = { fg = col30.green, ctermfg = 2 },
        CodeActionMenuDetailsDisabled       = { link = "Comment" },
        CodeActionMenuDetailsUndefined      = { link = "Comment" },
    }
end

return M
