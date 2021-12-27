local colors = {
    flavour = "dark", -- set type of colorscheme: dark/light
    bg = "#191724", -- background
    bg_alt = "#1f1d2e", -- alternate background
    bg_float = "#26233a", -- for floating windows and statuslines and pum sidebar and pum selected and CursorColumn
    inactive = "#555169", -- for stuff like empty folder(any inactive stuff)
    subtle = "#6e6a86", -- for comments and float border and more...
    fg = "#e0def4", -- the foreground/text color
    red = "#eb6f92", -- for errors
    yellow = "#f6c177", -- for warns
    orange = "#ebbcba", -- mostly for booleans
    blue = "#31748f", -- for keywords
    green = "#9ccfd8", -- for info and constructors/labels and diffadd
    magenta = "#c4a7e7", -- for hints and visual mode/search foreground/special comments/git stage and merge
    highlight = "#2a2837", -- ofc for highlighting (it is the bg of highlighted text)
    highlight_inactive = "#211f2d", -- same as highlight for inactive stuff and also cursor line
    highlight_overlay = "#3a384a", -- same as highlight for overlays (floats)
    none = "NONE",
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
