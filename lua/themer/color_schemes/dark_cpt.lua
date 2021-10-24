local util = require("themer.utils.util")

local colors = {
	none = "NONE",
	bg = "#0e171c", -- nvim bg
	bg_highlight = "#152127",
	fg = "#abb2bf", -- fg color (text)
	fg_gutter = "#3b4261",
	black = "#393b44",
	gray = "#2a2e36",
	red = "#c94f6d",
	green = "#97c374",
	yellow = "#dbc074",
	blue = "#61afef",
	magenta = "#c678dd",
	cyan = "#63cdcf",
	white = "#dfdfe0",
	orange = "#F4A261",
	pink = "#D67AD2",
	black_br = "#7f8c98",
	red_br = "#e06c75",
	green_br = "#58cd8b",
	yellow_br = "#FFE37E",
	blue_br = "#84CEE4",
	magenta_br = "#B8A1E3",
	cyan_br = "#59F0FF",
	white_br = "#FDEBC3",
	orange_br = "#F6A878",
	pink_br = "#DF97DB",
	comment = "#526175",
}

-- Some extra colors which require some util functions
colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
colors.fg_alt = util.darken(colors.fg, 0.80, "#000000")

colors.black = util.darken(colors.bg, 0.8, "#000000")

return colors
