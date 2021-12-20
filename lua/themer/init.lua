return setmetatable({}, {
    __call = function(_, ...)
        assert(
            type(...) == "table",
            "Themer: The passed on config to the setup should be a table. It seems like you passed a/an" .. type(...)
        )
        require("themer.config")("user", ...)
    end,
})
