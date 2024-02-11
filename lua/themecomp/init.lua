local M = {}

-- functions for color-related conversions/operations
M.colorconv = require "themecomp.colorconv"

-- default settings
M.settings = {
    -- directory to compile color schemes to (absolute path)
    ---@type string
    colors_dir = vim.fn.stdpath("config") .. "/colors",

    -- whether or not to use transparency
    ---@type boolean
    transparency = false,

    -- which theme to use
    ---@type string
    theme = "onedark",

    -- where to find color palettes (lua module path)
    -- overridden 
    ---@type string
    palette_path = "themecomp.palettes",

    -- where to find the user's color palettes (lua module path)
    -- takes precedence over palette_path
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

-- get a theme table
M.get_theme_table = function(name)
    -- use the default palette path
    local theme_path = M.settings.palette_path .. "." .. name

    -- use a custom 
    if M.settings.user_palette_path then
        local theme_path = M.settings.user_palette_path .. "." .. name
    end

    -- try to read the theme file in a protected call
    local present, theme = pcall(require, theme_path)

    -- return it if possible, complain if not
    if present then
        return theme
    else
        error "Failed to read theme table!"
    end
end

-- set up the plugin
M.setup = function(overrides)
    configure(overrides)

    if not vim.loop.fs_stat(M.settings.colors_dir .. "/.themes_compiled") then
        M.compile()
    end
end

return M
