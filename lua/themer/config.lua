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
        cmp = false,
        gitsigns = false,
        telescope = false,
        indent_blankline = {
            enabled = false,
            colored_indent_levels = false,
        },
        barbar = false,
        bufferline = false,
        markdown = false,
    },
    extra_integrations = {
        galaxyline = false,
        lualine = false,
    },
    all = false,
    use_vim_cmd = false, -- setting to true will use `vim.cmd[[hi ..]]` instead of `vim.api.nvim_set_hl()`
}

function config.set_options(opts)
    opts = opts or {}
    config.options = vim.tbl_deep_extend("force", config.options, opts)
    require("themer.main").load_colorscheme(config.options.colorscheme)
end

return config
