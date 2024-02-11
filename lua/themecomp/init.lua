local M = {}

-- functions for color-related conversions/operations
M.colorconv = require "themecomp.colorconv"

------------------------------------------------------------------------------------------------------------

-- default settings
-- custom paths must be specified both as lua modules and absolute paths;
-- this is annoying but required for IO stuff
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

    -- where to find color palettes (absolute path)
    ---@type string
    palette_path = debug.getinfo(1, "S").source:match("@?(.*/)") .. "palettes",

    -- where to find integrations (absolute path)
    ---@type string
    integration_path = debug.getinfo(1, "S").source:match("@?(.*/)") .. "integrations",

    -- list of integrations
    ---@type string[]
    integrations = {
        "alpha",
        "bufferline",
        "cmp",
        "defaults",
        "devicons",
        "git",
        "illuminate",
        "indentline",
        "lsp",
        "lspsaga",
        "mason",
        "navic",
        "notify",
        "nvimtree",
        "semantic_tokens",
        "syntax",
        "telescope",
        "term",
        "todo",
        "treesitter",
        "whichkey",
    }
}

------------------------------------------------------------------------------------------------------------

-- merge tables
M.merge_table = function(...)
    return vim.tbl_deep_extend("force", ...)
end

------------------------------------------------------------------------------------------------------------

-- compile themes
M.compile = function()
    if not vim.loop.fs_stat(M.settings.colors_dir) then
        vim.fn.mkdir(M.settings.colors_dir, "p")
    end

    if not vim.loop.fs_stat(M.settings.palette_path) then
        error "Palette path does not exist!"
    end

    for _, palettefile in ipairs(vim.fn.readdir(M.settings.palette_path)) do
        local scheme = dofile(M.settings.palette_path .. "/" .. palettefile)
        for _, integrationfile in ipairs(M.settings.integrations) do
            print(string.format("%s: %s", palettefile, integrationfile))
        end
    end
end

-- set up the plugin
M.setup = function(overrides)
    for k, v in pairs(overrides or {}) do
        M.settings[k] = v
    end

    if not vim.loop.fs_stat(M.settings.colors_dir .. "/.themes_compiled") then
        M.compile()
    end
end

return M
