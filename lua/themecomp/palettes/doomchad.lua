local M = {}

M.type = "dark"

M.base30 = {
    white = "#bbc2cf",
    darker_black = "#22262e",
    black = "#282c34", --  nvim bg
    black2 = "#2e323a",
    one_bg = "#32363e", -- real bg of onedark
    one_bg2 = "#3c4048",
    one_bg3 = "#41454d",
    grey = "#494d55",
    grey_fg = "#53575f",
    grey_fg2 = "#5d6169",
    light_grey = "#676b73",
    red = "#ff6b5a",
    baby_pink = "#ff7665",
    pink = "#ff75a0",
    line = "#3b3f47", -- for lines like vertsplit
    green = "#98be65",
    vibrant_green = "#a9cf76",
    nord_blue = "#47a5e5",
    blue = "#51afef",
    yellow = "#ECBE7B",
    sun = "#f2c481",
    purple = "#dc8ef3",
    dark_purple = "#c678dd",
    teal = "#4db5bd",
    orange = "#ea9558",
    cyan = "#46D9FF",
    statusline_bg = "#2d3139",
    lightbg = "#3a3e46",
    pmenu_bg = "#98be65",
    folder_bg = "#51afef",
}

M.base16 = {
    color00 = "#282c34",
    color01 = "#32363e",
    color02 = "#3c4048",
    color03 = "#4e525a",
    color04 = "#5a5e66",
    color05 = "#a7aebb",
    color06 = "#b3bac7",
    color07 = "#bbc2cf",
    color08 = "#ff6c6b",
    color09 = "#ea9558",
    color0A = "#ECBE7B",
    color0B = "#98be65",
    color0C = "#66c4ff",
    color0D = "#dc8ef3",
    color0E = "#48a6e6",
    color0F = "#c85a50",
}

M.polishhl = {
    treesitter = {
        ["@field"] = { fg = M.base30.blue },
        ["@punctuation.bracket"] = { fg = M.base30.yellow },
    },
}

return M
