---@class Config
local config = {}

config.options = {
    styles = {
        comments = { italic = true },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        parameters = {},
        fields = {},
        hint = {},
        info = {},
        warn = {},
        error = {},
        punctuation = {},
        comment = {},
    },
    virtual_text = {
        error = { italic = true },
        hint = { italic = true },
        warn = { italic = true },
        info = { italic = true },
    },
    underlines = {
        error = { underline = true },
        hint = { underline = true },
        warn = { underline = true },
        info = { underline = true },
    },
}

function config.setup(opts)
    opts = opts or {}
    config.options = vim.tbl_deep_extend("force", config.options, opts)
end

function config.get_config()
    local configuration = config.options
    config.options = {}
    return configuration
end

return config
