local M = {}

M.config = {
    test = "test",
}

M.setup = function(overrides)
    for k, v in pairs(overrides or {}) do
        M.config[k] = v
    end
end

print(M.config.test)
