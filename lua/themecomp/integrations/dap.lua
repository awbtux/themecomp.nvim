local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        -- Dap
        DapBreakpoint           = { fg = col30.red, ctermfg = 1 },
        DapBreakpointCondition  = { fg = col30.yellow, ctermfg = 11 },
        DapLogPoint             = { fg = col30.cyan, ctermfg = 14 },
        DapStopped              = { fg = col30.baby_pink, ctermfg = 13 },

        -- DapUI
        DAPUIScope          = { fg = col30.cyan, ctermfg = 6 },
        DAPUIType           = { fg = col30.dark_purple, ctermfg = 5 },
        DAPUIValue          = { fg = col30.cyan, ctermfg = 14 },
        DAPUIVariable       = { fg = col30.white, ctermfg = 7 },
        DapUIModifiedValue  = { fg = col30.orange, ctermfg = 3 },
        DapUIDecoration     = { fg = col30.cyan, ctermfg = 6 },
        DapUIThread         = { fg = col30.green, ctermfg = 2 },
        DapUIStoppedThread  = { fg = col30.cyan, ctermfg = 6 },
        DapUISource         = { fg = col30.lavender, ctermfg = 7 },
        DapUILineNumber     = { fg = col30.cyan, ctermfg = 15 },
        DapUIFloatBorder    = { link = "FloatBorder" },

        DapUIWatchesEmpty = { fg = col30.baby_pink, ctermfg = 13 },
        DapUIWatchesValue = { fg = col30.green, ctermfg = 2 },
        DapUIWatchesError = { fg = col30.baby_pink, ctermfg = 13 },

        DapUIBreakpointsPath            = { fg = col30.cyan, ctermfg = 6 },
        DapUIBreakpointsInfo            = { fg = col30.green, ctermfg = 2 },
        DapUIBreakPointsCurrentLine     = { fg = col30.green, ctermfg = 10, bold = true },
        DapUIBreakpointsDisabledLine    = { fg = col30.grey_fg2, ctermfg = 8 },

        DapUIStepOver       = { fg = col30.blue, ctermfg = 4 },
        DapUIStepOverNC     = { fg = col30.blue, ctermfg = 4 },
        DapUIStepInto       = { fg = col30.blue, ctermfg = 4 },
        DapUIStepIntoNC     = { fg = col30.blue, ctermfg = 4 },
        DapUIStepBack       = { fg = col30.blue, ctermfg = 4 },
        DapUIStepBackNC     = { fg = col30.blue, ctermfg = 4 },
        DapUIStepOut        = { fg = col30.blue, ctermfg = 4 },
        DapUIStepOutNC      = { fg = col30.blue, ctermfg = 4 },
        DapUIStop           = { fg = col30.red, ctermfg = 1 },
        DapUIStopNC         = { fg = col30.red, ctermfg = 1 },
        DapUIPlayPause      = { fg = col30.green, ctermfg = 2 },
        DapUIPlayPauseNC    = { fg = col30.green, ctermfg = 2 },
        DapUIRestart        = { fg = col30.green, ctermfg = 2 },
        DapUIRestartNC      = { fg = col30.green, ctermfg = 2 },
        DapUIUnavailable    = { fg = col30.grey_fg, ctermfg = 8 },
        DapUIUnavailableNC  = { fg = col30.grey_fg, ctermfg = 8 },
    }
end

return M
