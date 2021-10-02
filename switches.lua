function switch(value)
    local table = {
        ["value"] = value,
        ["default"] = nil,
        ["functions"] = {},
    }

    table.case = function(element, callback)
        table.functions[element] = callback
        return table
    end

    table.default = function(callback)
        table.default = callback
        return table
    end

    table.process = function()
        local case = table.functions[table.value]
        if case then
            case()
        elseif table.default then
            table.default()
        end
    end

    return table
end
