local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        CokeLineBackground                = { link = "TabLineFill" },
        CokeLineBufferSelected            = { link = "TabLineSel" },
        CokeLineBufferVisible             = { link = "TabLine" },

        CokeLineCloseButton               = { fg = col30.light_grey, ctermfg = 8, bg = col30.black2, ctermbg = 8 },
        CokeLineCloseButtonSelected       = { fg = col30.red, ctermfg = 1, bg = col30.black },
    }
end

return M
