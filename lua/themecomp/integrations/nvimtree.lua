local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        NvimTreeEmptyFolderName     = { fg = col30.folder_bg, ctermfg = 4 },
        NvimTreeEndOfBuffer         = { fg = col30.darker_black, ctermfg = 0 },
        NvimTreeFolderIcon          = { fg = col30.folder_bg, ctermfg = 4 },
        NvimTreeFolderName          = { fg = col30.folder_bg, ctermfg = 4 },
        NvimTreeFolderArrowOpen     = { fg = col30.folder_bg, ctermfg = 4 },
        NvimTreeFolderArrowClosed   = { fg = col30.grey_fg, ctermfg = 8 },
        NvimTreeGitDirty            = { fg = col30.red, ctermfg = 1 },
        NvimTreeIndentMarker        = { fg = (scheme.type == "dark" and require("themecomp.colorconv").lighten_hex(col30.line, -2) or col30.one_bg2) },
        NvimTreeNormal              = { bg = col30.darker_black },
        NvimTreeNormalNC            = { bg = col30.darker_black },
        NvimTreeOpenedFolderName    = { fg = col30.folder_bg, ctermfg = 4 },
        NvimTreeGitIgnored          = { fg = col30.light_grey, ctermfg = 8 },
        NvimTreeWinSeparator        = { fg = col30.darker_black, ctermfg = 8, bg = col30.darker_black },
        NvimTreeWindowPicker        = { fg = col30.red, bg = col30.black2, ctermfg = 1 },
        NvimTreeCursorLine          = { link = "CursorLine" },
        NvimTreeGitNew              = { fg = col30.green, ctermfg = 2 },
        NvimTreeGitDeleted          = { fg = col30.red, ctermfg = 1 },
        NvimTreeSpecialFile         = { fg = col30.yellow, ctermfg = 11, bold = true },
        NvimTreeRootFolder          = { fg = col30.red, ctermfg = 1, bold = true },
    }
end

return M
