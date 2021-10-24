---@class Config
local config = {}

config.options = {
    colorscheme = "dark_cpt", -- default colorscheme
    transparency = false,
	term_colors = true,
	styles = {
		comments = { italic = true },
		functions = { italic = true },
		keywords = { italic = true },
		strings = {},
		variables = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { italic = true },
				hints = { italic = true },
				warnings = { italic = true },
				information = { italic = true },
			},
			underlines = {
				errors = { underline = true },
				hints = { underline = true },
				warnings = { underline = true },
				information = { underline = true },
			},
		},
		-- TODO: add all the remaining highlights ASAP
		--	lsp_trouble = false,
		--	lsp_saga = false,
		--	gitgutter = false,
		--	gitsigns = false,
		--	telescope = false,
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
		--	barbar = false,
		--	bufferline = false,
		--	markdown = false,
		--	lightspeed = false,
		--	ts_rainbow = false,
		--	hop = false,
	},
	galaxyline = true,
}

function config.set_options(opts)
	opts = opts or {}
	config.options = vim.tbl_deep_extend("force", config.options, opts)
end

return config
