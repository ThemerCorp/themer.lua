---@class Config
local config = {}

config.options = {
    colorscheme = "rose_pine_moon", -- default colorscheme
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
        -- hint = nil,
        -- info = nil,
        -- warn = nil,
        -- error = nil,
        -- punctuation = nil,
        -- comment = nil,
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
        -- TODO: add all the remaining highlights ASAP
        --	lsp_trouble = true,
        --	lsp_saga = true,
        --	gitgutter = true,
        gitsigns = true,
        telescope = true,
        --	nvimtree = {
        --		enabled = true,
        --		show_root = true,
        --	},
        --	which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        --	dashboard = true,
        --	neogit = true,
        --	vim_sneak = true,
        --	fern = true,
        barbar = true,
        bufferline = true,
        markdown = true,
        --	lightspeed = true,
        --	ts_rainbow = true,
        --	hop = true,
    },
    extra_integrations = {
        galaxyline = true,
        lualine = true,
    },
}

function config.set_options(opts)
    opts = opts or {}
    config.options = vim.tbl_deep_extend("force", config.options, opts)
end

return config
