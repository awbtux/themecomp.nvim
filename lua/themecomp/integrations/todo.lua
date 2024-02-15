local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        TodoBgFix       = { fg = col30.black2, bg = col30.red, ctermfg = 0, ctermbg = 1, bold = true },
        TodoBgHack      = { fg = col30.black2, bg = col30.orange, ctermfg = 0, ctermbg = 3, bold = true },
        TodoBgNote      = { fg = col30.black2, bg = col30.white, ctermfg = 0, ctermbg = 7, bold = true },
        TodoBgPerf      = { fg = col30.black2, bg = col30.purple, ctermfg = 0, ctermbg = 5, bold = true },
        TodoBgTest      = { fg = col30.black2, bg = col30.purple, ctermfg = 0, ctermbg = 5, bold = true },
        TodoBgTodo      = { fg = col30.black2, bg = col30.yellow, ctermfg = 0, ctermbg = 11, bold = true },
        TodoBgWarn      = { fg = col30.orange, ctermfg = 3, bold = true },
        TodoFgFix       = { fg = col30.red, ctermfg = 1 },
        TodoFgHack      = { fg = col30.orange, ctermfg = 3 },
        TodoFgNote      = { fg = col30.white, ctermfg = 7 },
        TodoFgPerf      = { fg = col30.purple, ctermfg = 5 },
        TodoFgTest      = { fg = col30.purpl, ctermfg = 5 },
        TodoFgTodo      = { fg = col30.yellow, ctermfg = 11 },
        TodoFgWarn      = { fg = col30.orange, ctermfg = 3 },
        TodoSignFix     = { link = "TodoFgFix" },
        TodoSignHack    = { link = "TodoFgHack" },
        TodoSignNote    = { link = "TodoFgNote" },
        TodoSignPerf    = { link = "TodoFgPerf" },
        TodoSignTest    = { link = "TodoFgTest" },
        TodoSignTodo    = { link = "TodoFgTodo" },
        TodoSignWarn    = { link = "TodoFgWarn" },
    }
end

return M
