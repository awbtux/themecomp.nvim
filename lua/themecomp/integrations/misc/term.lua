local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        terminal_color_0  = col16.color01,
        terminal_color_1  = col16.color08,
        terminal_color_2  = col16.color0B,
        terminal_color_3  = col16.color0A,
        terminal_color_4  = col16.color0D,
        terminal_color_5  = col16.color0E,
        terminal_color_6  = col16.color0C,
        terminal_color_7  = col16.color05,
        terminal_color_8  = col16.color03,
        terminal_color_9  = col16.color08,
        terminal_color_10 = col16.color0B,
        terminal_color_11 = col16.color0A,
        terminal_color_12 = col16.color0D,
        terminal_color_13 = col16.color0E,
        terminal_color_14 = col16.color0C,
        terminal_color_15 = col16.color07,
    }
end

return M
