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

    -- whether or not to use the theme's terminal colors
    ---@type boolean
    terminal_colors = true,

    -- which theme to use
    ---@type string
    theme = nil,

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

-- convert highlight group tables to strings
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
    -- create the colors folder if needed
    if not vim.loop.fs_stat(M.settings.colors_dir) then
        vim.fn.mkdir(M.settings.colors_dir, "p")
    end

    -- palette path doesn't exist
    if not vim.loop.fs_stat(M.settings.palette_path) then
        error "Palette path does not exist!"
        return
    end

    -- integration path doesn't exist
    if not vim.loop.fs_stat(M.settings.integration_path) then
        error "Integration path does not exist!"
        return
    end

    -- for each palette
    for _, palettefile in ipairs(vim.fn.readdir(M.settings.palette_path)) do
        -- load the palette into 'scheme'
        local scheme = dofile(M.settings.palette_path .. "/" .. palettefile)

        -- initialize 'result' (the string to be written) with the palette name and type
        local result = string.format('vim.g.colors_name = "%s" vim.opt.background = "%s" ', scheme.scheme_name, scheme.type)

        -- get the filename of the color scheme
        local filename = M.settings.colors_dir .. "/" .. scheme.scheme_name .. ".lua"

        -- for each integration
        for _, integrationname in ipairs(M.settings.integrations) do

            -- ensure the integration exists
            if not vim.loop.fs_stat(M.settings.integration_path .. "/" .. integrationname .. ".lua") then
                error(string.format("%s: No such file or directory!", M.settings.integration_path .. "/" .. integrationname .. ".lua"))
                return
            end

            -- load the default highlights
            local integration = dofile(M.settings.integration_path .. "/" .. integrationname .. ".lua").set(scheme.base16, scheme.base30)

            -- apply per-theme highlight overrides
            if scheme.polishhl and scheme.polishhl[integrationname] then
                integration = M.merge_table(integration, scheme.polishhl[integrationname])
            end

            -- apply user-specified plugin-wide highlight overrides
            if M.settings.hl_overrides and M.settings.hl_overrides[integrationname] then
                integration = M.merge_table(integration, M.settings.hl_overrides[integrationname])
            end

            -- store the generated highlight table in 'result'
            result = result .. M.table_to_string(integration)
        end

        -- if applicable, set the terminal color variables
        if vim.loop.fs_stat(M.settings.integration_path .. "/misc/term.lua") and M.settings.terminal_colors then
            local termscheme = dofile(M.settings.integration_path .. "/misc/term.lua").set(scheme.base16, scheme.base30)

            for colname, colval in pairs(termscheme) do
                result = result .. string.format(' vim.g.%s = "%s" ', colname, colval)
            end
        end

        -- if applicable, use transparency
        if vim.loop.fs_stat(M.settings.integration_path .. "/misc/transparent.lua") then
            result = result .. "if vim.g.transparency then " .. M.table_to_string(dofile(M.settings.integration_path .. "/misc/transparent.lua").set(scheme.base16, scheme.base30)) .. ' vim.g.terminal_color_0 = "" vim.g.terminal_color_8 = "" ' .. "end"
        end

        -- write the theme file
        local file = io.open(filename, "w")
        if file then
            file:write(result)
            file:close()
        else
            error(string.format("%s: Unable to open file for writing", filename))
        end
    end

    -- prevent this function from being ran again automatically at plugin startup
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
    -- set user-specified settings
    for k, v in pairs(overrides or {}) do
        M.settings[k] = v
    end

    -- ThemeCompile command runs M.compile()
    vim.api.nvim_create_user_command("ThemeCompile", M.compile, {})

    -- run M.compile() if not done already
    if not vim.loop.fs_stat(M.settings.colors_dir .. "/.themes_compiled") then
        M.compile()
    end

    -- load the user-defined theme if one is provided
    if M.settings.theme then
        vim.cmd(string.format("silent! colorscheme %s", M.settings.theme))
    end
end

return M
