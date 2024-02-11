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

-- convert a theme table to string
M.table_to_string = function(table)
    local result = ""

    for hlgroupname, hlgroup_vals in pairs(table) do
        local hlname = "'" .. hlgroupname .. "',"
        local opts = ""

        for optName, optVal in pairs(hlgroup_vals) do
            local valueInStr = ((type(optVal)) == "boolean" or type(optVal) == "number") and tostring(optVal)
                or '"' .. optVal .. '"'
            opts = opts .. optName .. "=" .. valueInStr .. ","
        end

        result = result .. "vim.api.nvim_set_hl(0," .. hlname .. "{" .. opts .. "})"
    end

    return result
end

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

        local result = string.format('vim.g.colors_name = "%s" vim.opt.background = "%s" ', scheme.scheme_name, scheme.type)

        local filename = M.settings.colors_dir .. "/" .. scheme.scheme_name .. ".lua"

        for _, integrationname in ipairs(M.settings.integrations) do
            local integration = dofile(M.settings.integration_path .. "/" .. integrationname .. ".lua").set(scheme.base16, scheme.base30)

            if scheme.polishhl and scheme.polishhl[integrationname] then
                integration = M.merge_table(integration, scheme.polishhl[integrationname])
            end

            if M.settings.hl_overrides and M.settings.hl_overrides[integrationname] then
                integration = M.merge_table(integration, M.settings.hl_overrides[integrationname])
            end

            result = result .. M.table_to_string(integration)
        end

        result = result .. "if vim.g.transparency then " .. M.table_to_string(dofile(M.settings.integration_path .. "/transparent.lua").set(scheme.base16, scheme.base30)) .. " end"

        local file = io.open(filename, "w")
        if file then
            file:write(result)
            file:close()
        else
            error(string.format("%s: Unable to open file for writing", filename))
        end
    end

    local lockfile = io.open(M.settings.colors_dir .. "/.themes_compiled", "w")
    if lockfile then
        lockfile:write("")
        lockfile:close()
    else
        error(string.format("%s: Unable to open file for writing", M.settings.colors_dir .. "/.themes_compiled"))
    end
end

-- set up the plugin
M.setup = function(overrides)
    for k, v in pairs(overrides or {}) do
        M.settings[k] = v
    end

    vim.api.nvim_create_user_command("ThemeCompile", M.compile, {})

    if not vim.loop.fs_stat(M.settings.colors_dir .. "/.themes_compiled") then
        M.compile()
    end
end

return M
