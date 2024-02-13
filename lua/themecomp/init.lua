local M = {}

-- functions for color-related conversions/operations
M.colorconv = require "themecomp.colorconv"

-- path separator
local pathsep = "/"

-- path separator (for windows)
if vim.fn.has("win32") then
    pathsep = "\\"
end

-- path separator (if unix env detected)
if vim.fn.has("unix") then
    pathsep = "/"
end

------------------------------------------------------------------------------------------------------------

-- default settings
-- custom paths must be specified both as lua modules and absolute paths;
-- this is annoying but required for IO stuff
M.settings = {
    -- directory to compile color schemes to (absolute path)
    ---@type string
    colors_dir = vim.fn.stdpath("config") .. pathsep .. "colors",

    -- write a gitignore in the colors directory
    ---@type boolean
    gitignore = true,

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
        "cokeline",
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
        "tabby",
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

    -- a
    local themecount = 0

    -- for each palette
    for _, palettefile in ipairs(vim.fn.readdir(M.settings.palette_path)) do
        -- increment the theme count
        themecount = themecount + 1

        -- load the palette into 'scheme'
        local scheme = dofile(M.settings.palette_path .. pathsep .. palettefile)

        -- initialize 'result' (the string to be written) with the palette name and type
        local result = string.format('vim.g.colors_name = "%s" vim.opt.background = "%s" vim.cmd("hi clear") ', scheme.scheme_name, scheme.type)

        -- get the filename of the color scheme
        local filename = M.settings.colors_dir .. pathsep .. scheme.scheme_name .. ".lua"

        -- for each integration
        for _, integrationname in ipairs(M.settings.integrations) do

            -- ensure the integration exists
            if not vim.loop.fs_stat(M.settings.integration_path .. pathsep .. integrationname .. ".lua") then
                error(string.format("%s: No such file or directory!", M.settings.integration_path .. pathsep .. integrationname .. ".lua"))
                return
            end

            -- load the default highlights
            local integration = dofile(M.settings.integration_path .. pathsep .. integrationname .. ".lua").set(scheme.base16, scheme.base30)

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
        if vim.loop.fs_stat(M.settings.integration_path .. pathsep .. "misc" .. pathsep .. "term.lua") and M.settings.terminal_colors then
            local termscheme = dofile(M.settings.integration_path .. pathsep "misc" .. pathsep .. "term.lua").set(scheme.base16, scheme.base30)

            for colname, colval in pairs(termscheme) do
                result = result .. string.format(' vim.g.%s = "%s" ', colname, colval)
            end
        end

        -- if applicable, use transparency
        if vim.loop.fs_stat(M.settings.integration_path .. pathsep .. "misc" .. pathsep .. "transparent.lua") then
            result = result .. "if vim.g.transparency then " .. M.table_to_string(dofile(M.settings.integration_path .. pathsep .. "misc" .. pathsep .. "transparent.lua").set(scheme.base16, scheme.base30)) .. ' vim.g.terminal_color_0 = "" vim.g.terminal_color_8 = "" end'
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

    -- print success msg
    print(string.format("Compiled %d themes!", themecount))

    -- prevent this function from being ran again automatically at plugin startup
    local lockfile = io.open(M.settings.colors_dir .. pathsep .. ".themes_compiled", "w")
    if lockfile then
        lockfile:write("")
        lockfile:close()
    else
        error(string.format("%s: Unable to open file for writing", M.settings.colors_dir .. pathsep .. ".themes_compiled"))
    end

    -- write a gitignore for stuff generated here
    if M.settings.gitignore then
        local gitignore = io.open(M.settings.colors_dir .. pathsep .. ".gitignore", "w")
        if gitignore then
            gitignore:write(string.format("*.lua\n.themes_compiled\n"))
            gitignore:close()
        else
            error(string.format("%s: Unable to open file for writing", M.settings.colors_dir .. pathsep .. ".gitignore"))
        end
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
    if not vim.loop.fs_stat(M.settings.colors_dir .. pathsep .. ".themes_compiled") then
        M.compile()
    end

    -- load the user-defined theme if one is provided
    if M.settings.theme then
        vim.cmd(string.format("silent! colorscheme %s", M.settings.theme))
    end
end

return M
