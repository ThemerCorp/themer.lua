local log = require("themer.log")

local options = {
    colorscheme = "rose_pine", -- default colorscheme
    transparent = false,
    term_colors = true,
    styles = {
        -- :h nvim_set_hl()
        comment = { italic = true },
        func = {},
        keyword = {},
        string = {},
        variable = {},
        parameter = {},
        field = {},
        punc = {},
    },
    diagnostics = {
        colors = { -- Also can be used for stuff like TSError
            hint = "",
            info = "",
            error = "",
            warn = "",
        },
        virtual_text = {
            error = { italic = true },
            hint = { italic = true },
            warn = { italic = true },
            info = { italic = true },
        },
        underlines = {
            error = { undercurl = true },
            hint = { undercurl = true },
            warn = { undercurl = true },
            info = { undercurl = true },
        },
    },
    remaps = {
        palette = {},
        -- per colorscheme palette remaps, for example:
        -- remaps.palette = {
        --     rose_pine = {
        --     	base00 = "#000000"
        --     }
        -- },
        -- would recommend to look into vim.api.nvim_set_hl() docs before using this
        -- remaps.highlights = {
        --     rose_pine = {
        --     	Normal = { bg = "#000000" }
        --     }
        -- },
        --
        -- Also you can do remaps.highlights.globals  for global highlight remaps
        highlights = {},
    },
}

--- internal: iterate given options over the default config (for internal purposes)
--- user: iterate given options over the default config and loads the colorscheme
--- get: returns the options
--- @param type string
--- @param opts table
return function(type, opts)
    if type == "get" then
        return options
    elseif type == "internal" then
        options = vim.tbl_deep_extend("force", options, opts or {})
    elseif type == "user" then
        options = vim.tbl_deep_extend("force", options, opts or {})
        require("themer.main")(options.colorscheme)
        log.trace("Themer: options set and colorscheme loaded")
    end
end
