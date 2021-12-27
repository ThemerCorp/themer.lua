local log = require("themer.log")

local options = {
    colorscheme = "rose_pine", -- default colorscheme
    transparent = false,
    term_colors = true,
    styles = {
        -- :h nvim_set_hl()
        comment = {},
        func = {},
        keyword = {},
        string = {},
        variable = {},
        parameter = {},
        field = {},
        punc = {},
        heading = {
            h1 = {},
            h2 = {},
            h3 = {},
            h4 = {},
            h5 = {},
            h6 = {},
        },
    },
    diagnostics = {
        colors = { -- Also can be used for stuff like TSError
            hint = "",
            info = "",
            error = "",
            warn = "",
        },
        virtual_text = {
            error = { style = "italic" },
            hint = { style = "italic" },
            warn = { style = "italic" },
            info = { style = "italic" },
        },
        underlines = {
            error = { style = "undercurl" },
            hint = { style = "undercurl" },
            warn = { style = "undercurl" },
            info = { style = "undercurl" },
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

    langs = {
        html = true,
        md = true,
    },

    plugins = {
        treesitter = true,
        indentline = true,
        barbar = true,
        bufferline = true,
        cmp = true,
        gitsigns = true,
        lsp = true,
        telescope = true,
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
