local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        CokeLineBackground                = { link = "TabLineFill" },
        CokeLineBufferSelected            = { link = "TabLineSel" },
        CokeLineBufferVisible             = { link = "TabLine" },
        CokeLineCloseButton               = { link = "TabLineClose" },
        CokeLineCloseButtonSelected       = { link = "TabLineCloseSel" },
    }
end

return M
