local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        --IblChar             = { fg = col16.color01, ctermfg = 0 },
        IblChar             = { fg = col30.line, ctermfg = 8 },
        IblIndent           = { link = "IblChar" },
        IblScope            = { link = "IblChar" },
        IblScopeChar        = { link = "IblChar" },
        IblScopeFirstLine   = { link = "IblChar" },
        IblWhitespace       = { link = "Empty" },
    }
end
return M
