local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        Boolean         = { fg = col16.color09, ctermfg = 3 },
        Character       = { fg = col16.color08, ctermfg = 9 },
        Conditional     = { fg = col16.color0E, ctermfg = 5 },
        Constant        = { fg = col16.color08, ctermfg = 9 },
        Define          = { fg = col16.color0E, ctermfg = 5, sp = "none" },
        Delimiter       = { fg = col16.color0F, ctermfg = 1 },
        Float           = { fg = col16.color09, ctermfg = 3 },
        Variable        = { fg = col16.color05, ctermfg = 7 },
        Function        = { fg = col16.color0D, ctermfg = 4 },
        Identifier      = { fg = col16.color08, ctermfg = 9, sp = "none" },
        Include         = { fg = col16.color0D, ctermfg = 4 },
        Keyword         = { fg = col16.color0E, ctermfg = 5 },
        Label           = { fg = col16.color0A, ctermfg = 11 },
        Number          = { fg = col16.color09, ctermfg = 3 },
        Operator        = { fg = col16.color05, ctermfg = 7, sp = "none" },
        PreProc         = { fg = col16.color0A, ctermfg = 11 },
        Repeat          = { fg = col16.color0A, ctermfg = 11 },
        Special         = { fg = col16.color0C, ctermfg = 6 },
        SpecialChar     = { fg = col16.color0F, ctermfg = 1 },
        Statement       = { fg = col16.color08, ctermfg = 9 },
        StorageClass    = { fg = col16.color0A, ctermfg = 11 },
        String          = { fg = col16.color0B, ctermfg = 2 },
        Structure       = { fg = col16.color0E, ctermfg = 5 },
        Tag             = { fg = col16.color0A, ctermfg = 11 },
        Todo            = { fg = col16.color0A, ctermfg = 11, bg = col16.color01 },
        Type            = { fg = col16.color0A, ctermfg = 11, sp = "none" },
        Typedef         = { fg = col16.color0A, ctermfg = 11 },
    }
end

return M
