local M = {}

function M.set(scheme, opts)
    local col16 = scheme.base16
    local col30 = scheme.base30

    return {
        SagaBorder = { bg = col30.darker_black },
        SagaNormal = { bg = col30.darker_black },
    }
end

return M
