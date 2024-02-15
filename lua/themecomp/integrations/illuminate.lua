local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        IlluminatedWordText     = { bold = true, underline = true, reverse = false },
        IlluminatedWordRead     = { bold = true, underline = true, reverse = false },
        IlluminatedWordWrite    = { bold = true, underline = true, reverse = false },
    }
end

return M
