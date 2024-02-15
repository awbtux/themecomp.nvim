local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        MasonHeader             = { fg = col30.black, bg = col30.red, ctermfg = 0, ctermbg = 1 },
        MasonHighlight          = { fg = col30.blue, ctermfg = 4 },
        MasonHighlightBlock     = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },
        MasonHighlightBlockBold = { link = "MasonHighlightBlock" },
        MasonHeaderSecondary    = { link = "MasonHighlightBlock" },
        MasonMuted              = { fg = col30.light_grey, ctermfg = 8 },
        MasonMutedBlock         = { fg = col30.light_grey, bg = col30.one_bg, ctermfg = 7, ctermbg = 8 },
    }
end

return M
