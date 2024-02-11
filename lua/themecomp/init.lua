local M = {}

-- functions for color-related conversions/operations
M.colorconv = require "themecomp.colorconv"

-- default settings
M.settings = {
    -- directory to compile color schemes to (absolute path)
    ---@type string
    colors_dir = vim.fn.stdpath("config") .. "colors",

    -- whether or not to use transparency
    ---@type boolean
    transparency = false,

    -- which theme to use
    ---@type string
    theme = "onedark",

    -- where to find color palettes (lua module path)
    ---@type string
    palette_path = "themeconp.palettes",

    -- where to find the user's color palettes (lua module path)
    ---@type string
    user_palette_path = nil,
}

-- configure settings
local configure = function(overrides)
    for k, v in pairs(overrides or {}) do
        M.settings[k] = v
    end
    return M.settings
end

-- compile themes
M.compile = function()
    if not vim.loop.fs_stat(M.settings.colors_dir) then
        vim.fn.mkdir(M.settings.colors_dir, "p")
    end
    print("compiled")
end

-- set up the plugin
M.setup = function(overrides)
    configure(overrides)

    if not vim.loop.fs_stat(M.settings.colors_dir .. "/.themes_compiled") then
        M.compile()
    end
end

return M
