local M = {}

-- functions for color-related conversions/operations
M.colorconv = require "themecomp.colorconv"

------------------------------------------------------------------------------------------------------------

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

    -- where to find integrations (lua module path)
    -- overridden 
    ---@type string
    integration_path = "themecomp.integrations",

    -- where to find the user's integrations (lua module path)
    -- takes precedence over integration_path
    ---@type string
    user_integration_path = nil,

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

-- get an integration table
M.get_integration_table = function(name)
    -- use the default integration path
    local integration_path = M.settings.integration_path .. "." .. name

    -- use a custom 
    if M.settings.user_integration_path then
        local integration_path = M.settings.user_integration_path .. "." .. name
    end

    -- try to read the integration file in a protected call
    local present, integration = pcall(require, integration_path)

    -- return it if possible, complain if not
    if present then
        return integration
    else
        error "Failed to read integration table!"
    end
end

------------------------------------------------------------------------------------------------------------

-- compile themes
M.compile = function()
    if not vim.loop.fs_stat(M.settings.colors_dir) then
        vim.fn.mkdir(M.settings.colors_dir, "p")
    end

    --for _, filename in ipairs(M.settings.integrations) do
    --    M.cache_stirng(filename, M.load_integrationTB(filename))
    --end
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
