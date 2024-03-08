local M = {}

local lighten = require("themecomp.colorconv").lighten_hex

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        Hardline_bufferline_background = { fg = lighten(col30.green, vim.o.bg == "light" and 10 or -20), bg = "none", ctermfg = 2, ctermbg = "none" },
        Hardline_bufferline_background_modified = { fg = lighten(col30.blue, vim.o.bg == "light" and 10 or -20), bg = "none", ctermfg = 4, ctermbg = "none" },
        Hardline_bufferline_current = { fg = col30.green, bg = "none", ctermfg = 10, ctermbg = "none", bold = true },
        Hardline_bufferline_current_modified = { fg = col30.blue, bg = "none", ctermfg = 12, ctermbg = "none", bold = true },
        Hardline_bufferline_separator = { link = "TabLine" },
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
