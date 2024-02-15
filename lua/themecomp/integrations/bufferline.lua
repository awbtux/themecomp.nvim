local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        BufferLineBackground                = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = 8 },

        BufferLineBufferSelected            = { fg = col30.white, bg = col30.black, ctermfg = 15, ctermbg = "none" },
        BufferLineBufferVisible             = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = 8 },

        BufferLineError                     = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = "none" },
        BufferLineErrorDiagnostic           = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = "none" },

        BufferLineCloseButton               = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = "none" },
        BufferLineCloseButtonVisible        = { fg = col30.light_grey, bg = col30.black2, ctermfg = 7, ctermbg = "none" },
        BufferLineCloseButtonSelected       = { fg = col30.red, bg = col30.black, ctermfg = 1, ctermbg = "none" },

        BufferLineFill                      = { fg = col30.grey_fg, bg = col30.black2, ctermfg = 7, ctermbg = 8 },

        BufferlineIndicatorVisible          = { fg = col30.black2, bg = col30.black2, ctermfg = 0, ctermbg = "none" },
        BufferlineIndicatorSelected         = { fg = col30.black, bg = col30.black, ctermfg = 0, ctermbg = "none" },

        BufferLineModified                  = { fg = col30.red, bg = col30.black2, ctermfg = 8, ctermbg = "none" },
        BufferLineModifiedVisible           = { fg = col30.red, bg = col30.black2, ctermfg = 8, ctermbg = "none" },
        BufferLineModifiedSelected          = { fg = col30.green, bg = col30.black, ctermfg = 1, ctermbg = "none" },

        BufferLineOffsetSeparator           = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0, ctermbg = "none" },
        BufferLineSeparator                 = { fg = col30.black2, bg = col30.black2, ctermfg = 0, ctermbg = "none" },
        BufferLineSeparatorVisible          = { fg = col30.black2, bg = col30.black2, ctermfg = 0, ctermbg = "none" },
        BufferLineSeparatorSelected         = { fg = col30.black2, bg = col30.black2, ctermfg = 0, ctermbg = "none" },

        BufferLineTab                       = { fg = col30.light_grey, bg = col30.one_bg2, ctermfg = 7, ctermbg = 8 },
        BufferLineTabSelected               = { fg = col30.black2, bg = col30.nord_blue, ctermfg = 0, ctermbg = 4 },
        BufferLineTabClose                  = { fg = col30.red, bg = col30.black2, ctermfg = 1 },
        BufferLineTabSeparator              = { fg = col30.black2, bg = col30.black2, ctermfg = 0 },
        BufferLineTabSeparatorSelected      = { fg = col30.black2, bg = col30.black2, ctermfg = 0 },

        BufferLineDevIconDefault            = { fg = col30.grey_fg, bg = col30.black2, ctermfg = 8 },
        BufferLineDevIconDefaultSelected    = { fg = col30.white, bg = col30.black, ctermfg = 7 },
        BufferLineDevIconDefaultInactive    = { link = "BufferLineDevIconDefault", },

        BufferLineDuplicate                 = { fg = "none", bg = col30.black2 },
        BufferLineDuplicateSelected         = { fg = col30.red, bg = col30.black, ctermfg = 1, ctermbg = "none" },
        BufferLineDuplicateVisible          = { fg = col30.blue, bg = col30.black2, ctermfg = 4, ctermbg = "none" },

        BufferLineRightCustomAreaText1      = { fg = col30.white, ctermfg = 7 },
        BufferLineRightCustomAreaText2      = { fg = col30.red, ctermfg = 1 },
    }
end

return M
