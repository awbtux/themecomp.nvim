local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        TabbyBackground      = { link = "TabLineFill" },
        TabbyBufferSelected  = { link = "TabLineSel" },
        TabbyBufferVisible   = { link = "TabLine" },
    }
end

return M
