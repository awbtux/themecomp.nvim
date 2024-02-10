local M = {}

local opts = {
    test = "test",
}

M.configure = function(overrides)
    for k, v in pairs(overrides or {}) do
        opts[k] = v
    end

    return opts
end


M.setup = function(overrides)
    M.configure(overrides)
    print(opts.test)
end

return M
