--- @class config
local config = {}

config.options = {
	colorscheme = "rose_pine", -- default colorscheme
	transparency = false,
	term_colors = true,
	styles = {
		-- { italic = true } => italics
		-- { bold = true } => bold
		-- { undercurl = true } => undercurl
		--
		-- Also you can technically pass all the tables accepted by vim.api.nvim_set_hl()
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
	remaps = {
		palette = {}, 
		-- per colorscheme palette remaps, for example:
		-- remaps.palette = {
		--     rose_pine = {
		--     	base00 = "#000000"
		--     }
		-- },
		---- would recommend to look into vim.api.nvim_set_hl() docs before using this
    	-- remaps.highlights = {
    	--     rose_pine = {
    	--     	Normal = { bg = "#000000" }
    	--     }
    	-- },
        --
        -- Also you can do remaps.highlights.globals  for global highlight remaps
        highlights = {},
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
		gitsigns = true,
		telescope = false,
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
		},
		barbar = false,
		bufferline = false,
		markdown = true,
	},
	modes = {
		all = true,
		use_vim_cmd = false, -- setting to true will use `vim.cmd[[hi ..]]` instead of `vim.api.nvim_set_hl()`
	},
}

--- iterate given options over the default config (for internal purposes)
--- @param opts table
function config.__set_options(opts)
	opts = opts or {}
	config.options = vim.tbl_deep_extend("force", config.options, opts)
end

--- iterate given options over the default config and loads the colorscheme
--- @param opts table
function config.set_options(opts)
	opts = opts or {}
	config.options = vim.tbl_deep_extend("force", config.options, opts)
	require("themer.main").load_colorscheme(config.options.colorscheme)
end

return config
