local colors = {
    bg = "#232136",
    bg_alt = "#2a273f",
    bg_float = "#393552",
    inactive = "#59546d",
    subtle = "#817c9c",
    fg = "#e0def4",
    red = "#eb6f92",
    yellow = "#f6c177",
    orange = "#ea9a97",
    blue = "#3e8fb0",
    green = "#9ccfd8",
    magenta = "#c4a7e7",
    highlight = "#312f44",
    highlight_inactive = "#2a283d",
    highlight_overlay = "#3f3c53",
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
			TSInclude = { fg = colors.blue },
			TSProperty = { fg = colors.magenta },
			TSParameter = { fg = colors.magenta },
			TSFuncBuiltin = { fg = colors.red },
		}
	}
}

return colors
