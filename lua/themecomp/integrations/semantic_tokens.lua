local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        ["@lsp.type.class"]         = { link = "Structure" },
        ["@lsp.type.decorator"]     = { link = "Function" },
        ["@lsp.type.enum"]          = { link = "Type" },
        ["@lsp.type.enumMember"]    = { link = "Constant" },
        ["@lsp.type.function"]      = { link = "@function" },
        ["@lsp.type.interface"]     = { link = "Structure" },
        ["@lsp.type.macro"]         = { link = "@macro" },
        ["@lsp.type.method"]        = { link = "@method" },
        ["@lsp.type.namespace"]     = { link = "@namespace" },
        ["@lsp.type.parameter"]     = { link = "@parameter" },
        ["@lsp.type.property"]      = { link = "@property" },
        ["@lsp.type.struct"]        = { link = "Structure" },
        ["@lsp.type.type"]          = { link = "@type" },
        ["@lsp.type.typeParamater"] = { link = "TypeDef" },
        ["@lsp.type.variable"]      = { link = "@variable" },
        ["@event"]                  = { fg = col16.color08, ctermfg = 1 },
        ["@modifier"]               = { fg = col16.color08, ctermfg = 1 },
        ["@regexp"]                 = { fg = col16.color0F, ctermfg = 9 },
    }
end

return M
