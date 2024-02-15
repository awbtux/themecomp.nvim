local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    local hlgroups = {
        NavicIconsConstant      = { fg = col16.color09, ctermfg = 3 },
        NavicIconsFunction      = { fg = col16.color0D, ctermfg = 4 },
        NavicIconsIdentifier    = { fg = col16.color08, ctermfg = 1 },
        NavicIconsField         = { fg = col16.color08, ctermfg = 1 },
        NavicIconsVariable      = { fg = col16.color0E, ctermfg = 5 },
        NavicIconsSnippet       = { fg = col30.red, ctermfg = 9 },
        NavicIconsText          = { fg = col16.color0B, ctermfg = 2 },
        NavicIconsStructure     = { fg = col16.color0E, ctermfg = 13 },
        NavicIconsType          = { fg = col16.color0A, ctermfg = 11 },
        NavicIconsKeyword       = { fg = col16.color07, ctermfg = 15 },
        NavicIconsMethod        = { fg = col16.color0D, ctermfg = 12 },
        NavicIconsConstructor   = { fg = col30.blue, ctermfg = 4 },
        NavicIconsFolder        = { fg = col16.color07, ctermfg = 4 },
        NavicIconsModule        = { fg = col16.color0A, ctermfg = 3 },
        NavicIconsProperty      = { fg = col16.color08, ctermfg = 9 },
        NavicIconsEnum          = { fg = col30.blue, ctermfg = 12 },
        NavicIconsUnit          = { fg = col16.color0E, ctermfg = 5 },
        NavicIconsClass         = { fg = col30.teal, ctermfg = 6 },
        NavicIconsFile          = { fg = col16.color07, ctermfg = 15 },
        NavicIconsInterface     = { fg = col30.green, ctermfg = 10 },
        NavicIconsColor         = { fg = col30.white, ctermfg = 7 },
        NavicIconsReference     = { fg = col16.color05, ctermfg = 7 },
        NavicIconsEnumMember    = { fg = col30.purple, ctermfg = 13 },
        NavicIconsStruct        = { link = "NavicIconsStructure" },
        NavicIconsValue         = { fg = col30.cyan, ctermfg = 14 },
        NavicIconsEvent         = { fg = col30.yellow, ctermfg = 11 },
        NavicIconsOperator      = { fg = col16.color05, ctermfg = 7 },
        NavicIconsTypeParameter = { fg = col16.color08, ctermfg = 1 },
        NavicIconsNamespace     = { fg = col30.teal, ctermfg = 6 },
        NavicIconsPackage       = { fg = col30.green, ctermfg = 2 },
        NavicIconsString        = { fg = col30.green, ctermfg = 2 },
        NavicIconsNumber        = { fg = col30.pink, ctermfg = 13 },
        NavicIconsBoolean       = { fg = col30.orange, ctermfg = 3 },
        NavicIconsArray         = { fg = col30.blue, ctermfg = 4 },
        NavicIconsObject        = { fg = col16.color0E, ctermfg = 5 },
        NavicIconsKey           = { fg = col30.red, ctermfg = 9 },
        NavicIconsNull          = { fg = col30.cyan, ctermfg = 14 },
        NavicText               = { fg = col30.light_grey, ctermfg = 7 },
        NavicSeparator          = { fg = col30.red, ctermfg = 1 },
    }

    return hlgroups
end

return M
