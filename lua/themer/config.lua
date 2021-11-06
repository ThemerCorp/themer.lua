---@class config
local config = {}

config.options = {
    colorscheme = "rose_pine", -- default colorscheme
    transparency = false,
    term_colors = true,
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
        error = {},
        warn = {},
        punctuation = {},
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
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
        },
        cmp = true,
        gitsigns = true,
        telescope = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        barbar = true,
        bufferline = true,
        markdown = true,
    },
    extra_integrations = {
        galaxyline = true,
        lualine = true,
    },
}

function config.set_options(opts)
    opts = opts or {}
    config.options = vim.tbl_deep_extend("force", config.options, opts)
require("themer.main").load_colorscheme(config.options.colorscheme)
end

return config
