local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        Hardline_bufferline_background = {},
        Hardline_bufferline_background_modified = {},
        Hardline_bufferline_current = {},
        Hardline_bufferline_current_modified = {},
        Hardline_bufferline_separator = {},
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
