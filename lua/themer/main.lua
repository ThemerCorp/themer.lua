--- @class main
local main = {}
local config = require("themer.config")
local utils = require("themer.utils.util")

main.check_all = function()
	if config.options.all then
		-- Kinda? hard coded rn, coz the for loops were causing loop errors (one file was requiring other which was requiring itself)
		-- Pardon me for hard coding this 😐
		config.options = {
			styles = {
				comments = { italic = true },
				functions = { italic = true },
				keywords = { italic = true },
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
	end
end

--- @param cs string colorscheme name
function main.load_colorscheme(cs)
	vim.g.colors_name = cs or config.options.colorscheme
	main.check_all()
	local api = require("themer.api.colors").get_color_scheme(cs or config.options.colorscheme)
	if not api.status then
		vim.api.nvim_err_writeln(api.msg)
	end
	local theme = require("themer.core.mapper").apply(api.color_scheme)
	-- Support for galaxyline and lualine
	if config.options.extra_integrations.galaxyline then
		require("themer.extras.galaxyline").get(cs, theme)
	end

	utils.load(theme)
end

return main
