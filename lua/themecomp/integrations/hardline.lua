local M = {}

local lighten = require("themecomp.colorconv").lighten_hex

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        Hardline_bufferline_background = { fg = lighten(col30.green, -10), bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 2, ctermbg = 8 },
        Hardline_bufferline_background_modified = { fg = lighten(col30.blue, -10), bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermfg = 4, ctermbg = 8 },
        Hardline_bufferline_current = { fg = col30.green, bg = col30.black, ctermfg = 10, ctermbg = 0 },
        Hardline_bufferline_current_modified = { fg = col30.blue, bg = col30.black, ctermfg = 12, ctermbg = 0 },
        Hardline_bufferline_separator = { bg = lighten(col30.statusline_bg, scheme.type == "light" and -3 or 1), ctermbg = 8 },
        Hardline_error_active = {},
        Hardline_error_inactive = {},
        Hardline_high_active = {},
        Hardline_high_inactive = {},
        Hardline_low_active = {},
        Hardline_low_inactive = {},
        Hardline_med_active = {},
        Hardline_med_inactive = {},
        Hardline_mode_command = {},
        Hardline_mode_inactive = {},
        Hardline_mode_insert = {},
        Hardline_mode_normal = {},
        Hardline_mode_replace = {},
        Hardline_mode_visual = {},
        Hardline_warning_active = {},
        Hardline_warning_inactive = {},
    }
end

return M
