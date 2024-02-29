local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        -- current
        BufferCurrent           = { link = "TabLineSel" },
        BufferCurrentADDED      = { link = "TabLineSel" },
        BufferCurrentCHANGED    = { link = "TabLineSel" },
        BufferCurrentDELETED    = { link = "TabLineSel" },
        BufferCurrentERROR      = { link = "TabLineSel" },
        BufferCurrentHINT       = { link = "TabLineSel" },
        BufferCurrentINFO       = { link = "TabLineSel" },
        BufferCurrentWARN       = { link = "TabLineSel" },
        BufferCurrentIcon       = { link = "TabLineSel" },
        BufferCurrentIndex      = { fg = col16.color0D, ctermfg = 4 },
        BufferCurrentMod        = { fg = col16.color0A, ctermfg = 11 },
        BufferCurrentNumber     = { fg = col16.color0D, ctermfg = 4 },
        BufferCurrentSign       = { fg = col16.color0D, ctermfg = 4 },
        BufferCurrentSignRight  = { link = "TabLineSel" },
        BufferCurrentTarget     = { fg = col16.color0F, ctermfg = 1 },

        -- visible
        BufferVisible           = { link = "TabLine" },
        BufferVisibleADDED      = { link = "TabLine" },
        BufferVisibleCHANGED    = { link = "TabLine" },
        BufferVisibleDELETED    = { link = "TabLine" },
        BufferVisibleERROR      = { link = "TabLine" },
        BufferVisibleHINT       = { link = "TabLine" },
        BufferVisibleINFO       = { link = "TabLine" },
        BufferVisibleWARN       = { link = "TabLine" },
        BufferVisibleIcon       = { link = "TabLine" },
        BufferVisibleIndex      = { link = "TabLine" },
        BufferVisibleMod        = { link = "TabLine" },
        BufferVisibleNumber     = { link = "TabLine" },
        BufferVisibleSign       = { link = "TabLine" },
        BufferVisibleSignRight  = { link = "TabLine" },
        BufferVisibleTarget     = { fg = col16.color0F, ctermfg = 1 },

        -- inactive
        BufferInactive          = { link = "TabLineFill" },
        BufferInactiveADDED     = { link = "TabLineFill" },
        BufferInactiveCHANGED   = { link = "TabLineFill" },
        BufferInactiveDELETED   = { link = "TabLineFill" },
        BufferInactiveERROR     = { link = "TabLineFill" },
        BufferInactiveHINT      = { link = "TabLineFill" },
        BufferInactiveINFO      = { link = "TabLineFill" },
        BufferInactiveWARN      = { link = "TabLineFill" },
        BufferInactiveIcon      = { link = "TabLineFill" },
        BufferInactiveIndex     = { link = "TabLineFill" },
        BufferInactiveMod       = { link = "TabLineFill" },
        BufferInactiveNumber    = { link = "TabLineFill" },
        BufferInactiveSign      = { link = "TabLineFill" },
        BufferInactiveSignRight = { link = "TabLineFill" },
        BufferInactiveTarget    = { fg = col16.color0F, ctermfg = 1 },
    }
end

return M
