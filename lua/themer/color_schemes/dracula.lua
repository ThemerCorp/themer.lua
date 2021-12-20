local util = require("themer.utils.colors")

local colors = {
	none = "NONE",
	bg = "#282a36", -- nvim bg
	highlight = "#44475A",
	fg = "#f8f8f2", -- fg color (text)
	subtle = "#4B5263",
	inactive = "#4B5263",
	black = "#191a21",
	bg_float = "#2a2e36",
	red = "#ff5555",
	green = "#50fa7b",
	yellow = "#f1fa8c",
	blue = "#8be9fd",
	magenta = "#bd93f9",
	white = "#abb2bf",
	orange = "#ffb86c",
	comment = "#6272A4",
	groups = {
		{ styles = { comment = { fg = colors.comment } } },
	},
}

-- Some extra colors which require some util functions
colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
return colors
