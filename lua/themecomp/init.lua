local M = {}

-- functions for color-related conversions/operations
M.colorconv = require "themecomp.colorconv"

-- default settings
M.settings = {
    -- directory to compile color schemes to
    ---@type string
    colors_dir = vim.fn.stdpath("config") .. "colors",

    -- whether or not to use transparency
    ---@type boolean
    transparency = false,
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
end

-- set up the plugin
M.setup = function(overrides)
    configure(overrides)

    if not vim.loop.fs_stat(M.settings.colors_dir .. "/.themes_compiled") then
        print("test")
        M.compile()
    end

    --if M.settings.transparency then
    --    local glassy = require "base46.glassy"
    --    for key, value in pairs(glassy) do
    --        if highlights[key] then
    --            highlights[key] = M.merge_tb(highlights[key], value)
    --        end
    --    end
    --end
end

return M
