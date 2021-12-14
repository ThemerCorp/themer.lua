--- @class main
local main = {}
local config = require("themer.config")
local utils = require("themer.utils")

--- checks for the modes
local __check_modes = function()
    if config.options.modes.all then
        require('themer.config').__set_options({
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
        })
    end
end

--- loads the colorscheme
--- @param cs string colorscheme name
function main.load_colorscheme(cs)
    vim.g.colors_name = cs or config.options.colorscheme
	__check_modes()
	vim.notify(vim.inspect(config.options.indent_blankline))
	local api = require("themer.api.colors").get_color_scheme(cs or config.options.colorscheme)
    if not api.status then
        vim.api.nvim_err_writeln(api.msg)
    end
    local theme = require("themer.core.mapper").apply(api.color_scheme, cs)
    utils.load(theme)
end

return main
