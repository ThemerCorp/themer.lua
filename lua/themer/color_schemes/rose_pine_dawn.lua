local colors = {
    flavour = "light",
    bg = "#faf4ed",
    bg_alt = "#fffaf3",
    bg_float = "#f2e9de",
    inactive = "#9893a5",
    subtle = "#6e6a86",
    fg = "#575279",
    red = "#b4637a",
    yellow = "#ea9d34",
    orange = "#d7827e",
    blue = "#286983",
    green = "#56949f",
    magenta = "#907aa9",
    highlight = "#f4ede8",
    highlight_inactive = "#dfdad9",
    highlight_bg_float = "#cecacd",
}

colors.groups = {
	styles = {
		string = { fg = colors.yellow },
		keyword = { fg = colors.blue },
		func = { fg = colors.orange },
	},
}

colors.remaps = {
	plugins = {
		treesitter = {
			TSField = { fg = colors.green },
			TSPunctBracket = { fg = colors.subtle },
			TSConstructor = { fg = colors.green },
			TSKeywordReturn = { fg = colors.blue },
			TSProperty = { fg = colors.magenta },
			TSParameter = { fg = colors.magenta },
			TSFuncBuiltin = { fg = colors.red },
			TSInclude = { fg = colors.blue },
		}
	}
}

return colors
