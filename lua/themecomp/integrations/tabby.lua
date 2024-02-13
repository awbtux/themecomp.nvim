local M = {}

local lighten = require("themecomp.colorconv").change_hex_lightness

function M.set(col16, col30)
    return {
        TabbyBackground                = { fg = lighten(col30.light_grey, 5), ctermfg = 7, bg = lighten(col30.one_bg, 2), ctermbg = 8 },
        TabbyBufferSelected            = { fg = col30.white, ctermfg = 15, bg = col30.black, ctermbg = 0 },
        TabbyBufferVisible             = { fg = lighten(col30.light_grey, 5), ctermfg = 4, bg = lighten(col30.one_bg, 2), ctermbg = 4 },

        TabbyCloseButton               = { fg = col30.light_grey, ctermfg = 8, bg = col30.black2, ctermbg = 8 },
        TabbyCloseButtonSelected       = { fg = col30.red, ctermfg = 1, bg = col30.black, },
    }
end

return M
