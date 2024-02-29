local M = {}

local lighten = require("themecomp.colorconv").lighten_hex

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        Empty                  = { fg = "none", bg = "none", ctermfg = "none", ctermbg = "none" },

        Normal                 = { fg = col16.color05, bg = col16.color00 },
        NormalFloat            = { bg = col30.darker_black },
        StatusLine             = { fg = col30.white, bg = col30.statusline_bg, ctermfg = 15, ctermbg = 8 },
        StatusLineNC           = { fg = col30.grey_fg2, bg = col30.statusline_bg, ctermfg = 7, ctermbg = 8 },

        Cursor                 = { fg = col16.color00, bg = col16.color05 },
        CursorColumn           = { bg = col16.color01, sp = "none" },
        SignColumn             = { fg = col16.color03, sp = "none" },
        ColorColumn            = { bg = col30.black2 },

        LineNr                 = { fg = col30.grey, ctermfg = 8 },
        CursorLine             = { bg = col30.black2 },
        CursorLineSign         = { bg = col30.black2 },
        CursorLineNr           = { fg = col30.white, bg = col30.black2 },

        UnderLined             = { underline = true },
        Bold                   = { bold = true },
        Italic                 = { italic = true },
        Conceal                = { bg = "none" },

        TabLine                = { fg = col30.grey_fg2, bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 7, ctermbg = 8 },
        TabLineFill            = { link = "TabLine" },
        TabLineSel             = { fg = col16.white, bg = col30.black, ctermfg = 15, bold = true },
        TabLineDelim           = { fg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 8, ctermbg = 8 },
        TabLineDelimSel        = { fg = col30.black, bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 0, ctermbg = 8 },
        TabLineClose           = { fg = col30.grey_fg2, ctermfg = 8 },
        TabLineCloseSel        = { fg = col30.red, ctermfg = 1 },

        Pmenu                  = { bg = col30.one_bg, ctermbg = 8 },
        PmenuSbar              = { bg = col30.one_bg, ctermbg = 8 },
        PmenuSel               = { fg = col30.black, bg = col30.pmenu_bg, ctermfg = 0, ctermbg = 2 },
        PmenuThumb             = { bg = col30.grey },
        WildMenu               = { fg = col16.color08, bg = col16.color0A, ctermfg = 9, ctermbg = 11 },

        MatchWord              = { bg = col30.grey, fg = col30.white },
        MatchParen             = { link = "MatchWord" },

        MsgArea                = { link = "Normal" },
        MsgSeparator           = { link = "StatusLine" },

        Comment                = { fg = col30.grey_fg, ctermfg = 8 },
        NonText                = { fg = col16.color01, ctermfg = 8 },

        FloatBorder            = { fg = col30.grey, ctermfg = 8 },
        WinSeparator           = { fg = col30.line, ctermfg = 8 },
        VertSplit              = { link = "WinSeparator" },
        ToggleTerm1FloatBorder = { link = "FloatBorder" },

        Error                  = { fg = col16.color00, bg = col16.color08, ctermfg = 0, ctermbg = 1 },
        ErrorMsg               = { fg = col16.color08, bg = col16.color00, ctermfg = 1 },
        NvimInternalError      = { fg = col30.red, ctermfg = 1 },
        WarningMsg             = { fg = col16.color0A, ctermfg = 3 },
        Question               = { fg = col16.color0D, ctermfg = 4 },

        SpellBad               = { undercurl = true, sp = col16.color08 },
        SpellLocal             = { undercurl = true, sp = col16.color0C },
        SpellCap               = { undercurl = true, sp = col16.color0D },
        SpellRare              = { undercurl = true, sp = col16.color0E },

        Debug                  = { fg = col16.color08, ctermfg = 1 },
        Exception              = { fg = col16.color08, ctermfg = 1 },

        ModeMsg                = { fg = col30.grey_fg2, ctermfg = 7 },
        MoreMsg                = { fg = col30.grey_fg2, ctermfg = 7 },

        IncSearch              = { fg = col16.color01, bg = col16.color09, ctermfg = 0, ctermbg = 3 },
        Search                 = { fg = col16.color01, bg = col16.color0A, ctermfg = 0, ctermbg = 3 },

        Visual                 = { fg = col16.color05, bg = col16.color02, ctermfg = 7, ctermbg = 8 },
        VisualNOS              = { fg = col16.color08, ctermfg = 1 },

        Directory              = { fg = col16.color0D, ctermfg = 4 },

        FoldColumn             = { fg = col30.light_grey, bg = col16.color01, ctermfg = 0, ctermbg = 8 },
        Folded                 = { fg = col30.light_grey, bg = col16.color01, ctermfg = 0, ctermbg = 8 },
        CursorLineFold         = { link = "FoldColumn" },

        Macro                  = { fg = col16.color08, ctermfg = 1 },
        Substitute             = { fg = col16.color01, bg = col16.color0A, ctermfg = 0, ctermbg = 3, sp = "none" },
        SpecialKey             = { fg = col16.color03, ctermfg = 8 },
        TooLong                = { fg = col16.color08, ctermfg = 1 },
        Title                  = { fg = col16.color0D, ctermfg = 4, sp = "none" },
        QuickFixLine           = { bg = col16.color01, sp = "none" },

        healthSuccess          = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },

        LazyH1                 = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },
        LazyButton             = { fg = lighten(col30.light_grey, scheme.type == "dark" and 10 or -20), bg = col30.one_bg, ctermfg = 7, ctermbg = 8 },
        LazyH2                 = { fg = col30.red, ctermfg = 1, bold = true, underline = true },
        LazyReasonPlugin       = { fg = col30.red, ctermfg = 1 },
        LazyValue              = { fg = col30.teal, ctermfg = 6 },
        LazyDir                = { fg = col16.color05, ctermfg = 7 },
        LazyUrl                = { fg = col16.color05, ctermfg = 7 },
        LazyCommit             = { fg = col30.green, ctermfg = 2 },
        LazyNoCond             = { fg = col30.red, ctermfg = 1 },
        LazySpecial            = { fg = col30.blue, ctermfg = 4 },
        LazyReasonFt           = { fg = col30.purple, ctermfg = 5 },
        LazyOperator           = { fg = col30.white, ctermfg = 7 },
        LazyReasonKeys         = { fg = col30.teal, ctermfg = 6 },
        LazyTaskOutput         = { fg = col30.white, ctermfg = 7 },
        LazyCommitIssue        = { fg = col30.pink, ctermfg = 13 },
        LazyReasonEvent        = { fg = col30.yellow, ctermfg = 3 },
        LazyReasonStart        = { fg = col30.white, ctermfg = 7 },
        LazyReasonRuntime      = { fg = col30.nord_blue, ctermfg = 4 },
        LazyReasonCmd          = { fg = col30.sun, ctermfg = 11 },
        LazyReasonSource       = { fg = col30.cyan, ctermfg = 14 },
        LazyReasonImport       = { fg = col30.white, ctermfg = 7 },
        LazyProgressDone       = { fg = col30.green, ctermfg = 2 },
    }
end

return M
