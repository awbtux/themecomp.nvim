local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    local highlights = {
        CmpItemAbbr         = { fg = col30.white, ctermfg = 7 },
        CmpItemAbbrMatch    = { fg = col30.blue, ctermfg = 4, bold = true },
        CmpDoc              = { bg = col30.darker_black },
        CmpDocBorder        = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0 },
        CmpPmenu            = { bg = col30.black },
        CmpSel              = { link = "PmenuSel", bold = true },
    }

    local item_kinds = {
        CmpItemKindConstant         = { fg = col16.color09, ctermfg = 3 },
        CmpItemKindFunction         = { fg = col16.color0D, ctermfg = 4 },
        CmpItemKindIdentifier       = { fg = col16.color08, ctermfg = 1 },
        CmpItemKindField            = { fg = col16.color08, ctermfg = 1 },
        CmpItemKindVariable         = { fg = col16.color0E, ctermfg = 13 },
        CmpItemKindSnippet          = { fg = col30.red, ctermfg = 1 },
        CmpItemKindText             = { fg = col16.color0B, ctermfg = 2 },
        CmpItemKindStructure        = { fg = col16.color0E, ctermfg = 5 },
        CmpItemKindType             = { fg = col16.color0A, ctermfg = 11 },
        CmpItemKindKeyword          = { fg = col16.color07, ctermfg = 15 },
        CmpItemKindMethod           = { fg = col16.color0D, ctermfg = 4 },
        CmpItemKindConstructor      = { fg = col30.blue, ctermfg = 12 },
        CmpItemKindFolder           = { fg = col16.color07, ctermfg = 15 },
        CmpItemKindModule           = { fg = col16.color0A, ctermfg = 11 },
        CmpItemKindProperty         = { fg = col16.color08, ctermfg = 1 },
        CmpItemKindEnum             = { fg = col30.blue, ctermfg = 12 },
        CmpItemKindUnit             = { fg = col16.color0E, ctermfg = 5 },
        CmpItemKindClass            = { fg = col30.teal, ctermfg = 14 },
        CmpItemKindFile             = { fg = col16.color07, ctermfg = 15 },
        CmpItemKindInterface        = { fg = col30.green, ctermfg = 10 },
        CmpItemKindColor            = { fg = col30.white, ctermfg = 15 },
        CmpItemKindReference        = { fg = col16.color05, ctermfg = 7 },
        CmpItemKindEnumMember       = { fg = col30.purple, ctermfg = 5 },
        CmpItemKindStruct           = { fg = col16.color0E, ctermfg = 13 },
        CmpItemKindValue            = { fg = col30.cyan, ctermfg = 14 },
        CmpItemKindEvent            = { fg = col30.yellow, ctermfg = 11 },
        CmpItemKindOperator         = { fg = col16.color05, ctermfg = 7 },
        CmpItemKindTypeParameter    = { fg = col16.color08, ctermfg = 1 },
        CmpItemKindCopilot          = { fg = col30.green, ctermfg = 10 },
        CmpItemKindCodeium          = { fg = col30.vibrant_green, ctermfg = 10 },
        CmpItemKindTabNine          = { fg = col30.baby_pink, ctermfg = 13 },
    }

    local styles = {
        default = {
            CmpBorder = { fg = col30[opts.cmp_border_color] },
        },

        atom = {
            CmpItemMenu     = { fg = col30.light_grey, ctermfg = 8, italic = true },
            CmpPmenu        = { bg = col30.black2 },
            CmpDoc          = { bg = col30.darker_black },
            CmpDocBorder    = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0 },
        },

        atom_colored = {
            CmpItemMenu     = { fg = col30.light_grey, ctermfg = 8, italic = true },
            CmpPmenu        = { bg = col30.black2, },
            CmpDoc          = { bg = col30.darker_black },
            CmpDocBorder    = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0 },
        },

        flat_light = {
            CmpPmenu        = { bg = col30.black2, },
            CmpBorder       = { fg = col30.black2, bg = col30.black2, ctermfg = 0 },
            CmpDocBorder    = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0 },
        },

        flat_dark = {
            CmpPmenu        = { bg = col30.darker_black, },
            CmpBorder       = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0 },
            CmpDocBorder    = { fg = col30.black2, bg = col30.black2, ctermfg = 0 },
            CmpDoc          = { bg = col30.black2 },
        },
    }

    local lighten = require("themecomp.colorconv").lighten_hex

    -- override item_kind highlights for atom style
    if opts.cmp_style == "atom" then
        for key, value in pairs(item_kinds) do
            item_kinds[key] = vim.tbl_deep_extend(
                "force",
                value,
                { bg = scheme.type == "dark" and lighten(col30.black2, 6) or lighten(col30.black2, -6) }
            )
        end
    end

    -- override item_kind highlights for atom_colored style
    if opts.cmp_style == "atom_colored" then
        for key, value in pairs(item_kinds) do
            item_kinds[key] = { fg = col30.black, bg = lighten(value.fg, -3), bold = true }
        end
    end

    highlights = vim.tbl_deep_extend("force", highlights, styles[opts.cmp_style] or {})
    highlights = vim.tbl_deep_extend("force", highlights, item_kinds)

    if opts.cmp_selection_bg == "simple" then
        highlights.CmpSel = { fg = col30.white, bg = (highlights.CmpPmenu.bg == col30.black2 and col30.grey or col30.one_bg3), bold = true }
    end

    return highlights
end

return M
