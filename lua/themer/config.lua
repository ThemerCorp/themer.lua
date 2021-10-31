---@class Config
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
    },
    colors = {
        --		hint = nil,
        --		info = nil,
        --		warn = nil,
        --		error = nil,
        --		punctuation = nil,
        --		comment = nil,
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
        -- TODO: add all the remaining highlights ASAP
        --	lsp_trouble = false,
        --	lsp_saga = false,
        --	gitgutter = false,
        gitsigns = false,
        telescope = false,
        --	nvimtree = {
        --		enabled = false,
        --		show_root = false,
        --	},
        --	which_key = false,
        indent_blankline = {
            enabled = false,
            colored_indent_levels = false,
        },
        --	dashboard = false,
        --	neogit = false,
        --	vim_sneak = false,
        --	fern = false,
        barbar = false,
        bufferline = false,
        markdown = false,
        --	lightspeed = false,
        --	ts_rainbow = false,
        --	hop = false,
    },
    extra_integrations = {
        galaxyline = false,
        lualine = false,
    },
}

function config.set_options(opts)
    opts = opts or {}
    config.options = vim.tbl_deep_extend("force", config.options, opts)
end

return config
