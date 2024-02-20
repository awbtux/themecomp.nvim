local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        BufferLineBackground                = { link = "TabLineFill" },

        BufferLineBufferSelected            = { link = "TabLineSel" },
        BufferLineBufferVisible             = { link = "TabLine" },

        BufferLineError                     = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = "none" },
        BufferLineErrorDiagnostic           = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = "none" },

        BufferLineCloseButton               = { link = "TabLineClose" },
        BufferLineCloseButtonVisible        = { link = "TabLineClose" },
        BufferLineCloseButtonSelected       = { link = "TabLineCloseSel" },

        BufferLineFill                      = { link = "TabLineFill" },

        BufferlineIndicatorVisible          = { fg = col30.black2, bg = col30.black2, ctermfg = 0, ctermbg = "none" },
        BufferlineIndicatorSelected         = { fg = col30.black, bg = col30.black, ctermfg = 0, ctermbg = "none" },

        BufferLineModified                  = { fg = col30.red, bg = col30.black2, ctermfg = 8, ctermbg = "none" },
        BufferLineModifiedVisible           = { fg = col30.red, bg = col30.black2, ctermfg = 8, ctermbg = "none" },
        BufferLineModifiedSelected          = { fg = col30.green, bg = col30.black, ctermfg = 1, ctermbg = "none" },

        BufferLineOffsetSeparator           = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0, ctermbg = "none" },
        BufferLineSeparator                 = { link = "TabLineDelim" },
        BufferLineSeparatorVisible          = { link = "TabLineDelim" },
        BufferLineSeparatorSelected         = { link = "TabLineDelimSel" },

        BufferLineTab                       = { fg = col30.light_grey, bg = col30.one_bg2, ctermfg = 7, ctermbg = 8 },
        BufferLineTabSelected               = { fg = col30.black2, bg = col30.nord_blue, ctermfg = 0, ctermbg = 4 },
        BufferLineTabClose                  = { fg = col30.red, bg = col30.black2, ctermfg = 1 },
        BufferLineTabSeparator              = { fg = col30.black2, bg = col30.black2, ctermfg = 0 },
        BufferLineTabSeparatorSelected      = { fg = col30.black2, bg = col30.black2, ctermfg = 0 },

        BufferLineDevIconDefault            = { link = "TabLine" },
        BufferLineDevIconDefaultSelected    = { link = "TabLineSel" },
        BufferLineDevIconDefaultInactive    = { link = "BufferLineDevIconDefault", },

        BufferLineDuplicateSelected         = { fg = col30.red, ctermfg = 1 },
        BufferLineDuplicateVisible          = { fg = col30.blue, ctermfg = 4 },

        BufferLineRightCustomAreaText1      = { fg = col30.white, ctermfg = 7 },
        BufferLineRightCustomAreaText2      = { fg = col30.red, ctermfg = 1 },
    }
end

return M
