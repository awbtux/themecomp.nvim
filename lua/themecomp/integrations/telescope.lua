local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    local hlgroups = {
        TelescopePromptPrefix       = { fg = col30.red, bg = col30.black2, ctermfg = 1 },
        TelescopeNormal             = { fg = col30.white, bg = col30.darker_black, ctermfg = 7 },
        TelescopePreviewTitle       = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },
        TelescopePromptTitle        = { fg = col30.black, bg = col30.red, ctermfg = 0, ctermbg = 1 },
        TelescopeSelection          = { fg = col30.white, bg = col30.black2, ctermfg = 15 },
        TelescopeResultsDiffAdd     = { fg = col30.green, ctermfg = 2 },
        TelescopeResultsDiffChange  = { fg = col30.yellow, ctermfg = 11 },
        TelescopeResultsDiffDelete  = { fg = col30.red, ctermfg = 1 },
        TelescopeMatching           = { bg = col30.one_bg, fg = col30.blue, ctermfg = 4 },
    }

    local styles = {
        borderless = {
            TelescopeBorder         = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 8 },
            TelescopePromptBorder   = { fg = col30.black2, bg = col30.black2, ctermfg = 8 },
            TelescopePromptNormal   = { fg = col30.white, bg = col30.black2, ctermfg = 7 },
            TelescopeResultsTitle   = { fg = col30.darker_black, bg = col30.darker_black, ctermfg = 0 },
            TelescopePromptPrefix   = { fg = col30.red, bg = col30.black2, ctermfg = 1 },
        },
        bordered = {
            TelescopeBorder         = { link = "FloatBorder" },
            TelescopePromptBorder   = { link = "FloatBorder" },
            TelescopeNormal         = { bg = col30.black },
            TelescopePromptNormal   = { bg = col30.black },
            TelescopeResultsTitle   = { fg = col30.black, bg = col30.green, ctermfg = 0, ctermbg = 2 },
            TelescopePromptPrefix   = { fg = col30.red, bg = col30.black, ctermfg = 1 },
            TelescopePreviewTitle   = { fg = col30.black, bg = col30.blue, ctermfg = 0, ctermbg = 2 },
        },
    }

    local result = vim.tbl_deep_extend("force", hlgroups, styles[opts.telescope_style])

    return result
end

return M
