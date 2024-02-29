local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        -- diff
        Added               = { fg = col30.green, ctermfg = 2 },
        Changed             = { fg = col30.orange, ctermfg = 3 },
        diffOldFile         = { fg = col30.baby_pink, ctermfg = 5 },
        diffNewFile         = { fg = col30.blue, ctermfg = 4 },
        DiffAdd             = { fg = col30.blue, ctermfg = 4 },
        DiffAdded           = { fg = col30.green, ctermfg = 2 },
        DiffChange          = { fg = col30.light_grey, ctermfg = 8 },
        DiffChangeDelete    = { fg = col30.red, ctermfg = 1 },
        DiffModified        = { fg = col30.orange, ctermfg = 3 },
        DiffDelete          = { fg = col30.red, ctermfg = 1 },
        DiffRemoved         = { fg = col30.red, ctermfg = 1 },
        DiffText            = { fg = col30.white, bg = col30.black2 },
        Removed             = { fg = col30.red, ctermfg = 1 },

        -- git commits
        gitcommitOverflow       = { fg = col16.color08, ctermfg = 1 },
        gitcommitSummary        = { fg = col16.color0B, ctermfg = 2 },
        gitcommitComment        = { fg = col16.color03, ctermfg = 8 },
        gitcommitUntracked      = { fg = col16.color03, ctermfg = 8 },
        gitcommitDiscarded      = { fg = col16.color03, ctermfg = 8 },
        gitcommitSelected       = { fg = col16.color03, ctermfg = 8 },
        gitcommitHeader         = { fg = col16.color0E, ctermfg = 5 },
        gitcommitSelectedType   = { fg = col16.color0D, ctermfg = 4 },
        gitcommitUnmergedType   = { fg = col16.color0D, ctermfg = 4 },
        gitcommitDiscardedType  = { fg = col16.color0D, ctermfg = 4 },
        gitcommitBranch         = { fg = col16.color09, ctermfg = 3, bold = true },
        gitcommitUntrackedFile  = { fg = col16.color0A, ctermfg = 11 },
        gitcommitUnmergedFile   = { fg = col16.color08, ctermfg = 1, bold = true },
        gitcommitDiscardedFile  = { fg = col16.color08, ctermfg = 1, bold = true },
        gitcommitSelectedFile   = { fg = col16.color0B, ctermfg = 2, bold = true },
    }
end

return M
