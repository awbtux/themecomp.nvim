local M = {}

-- default settings
local settings = {
    -- absolute path to the directory compiled schemes should be stored in
    ---@type string
    colors_dir = vim.fn.stdpath("config") .. "/colors",

    -- integrations dir (lua module path)
    ---@type string
    integrations_module = "themecomp.integrations",
}

-- configure settings
local configure = function(overrides)
    for k, v in pairs(overrides or {}) do
        settings[k] = v
    end
    return settings
end


-- set up the plugin
M.setup = function(overrides)
    configure(overrides)
end

return M
