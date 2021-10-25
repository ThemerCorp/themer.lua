local util = require('themer.utils.util')

local colors = {
    none = "NONE",
	bg = "#282a36", -- nvim bg
	bg_highlight = "#44475a",
	fg = "#f8f8f2", -- fg color (text)
	fg_gutter = "#4B5263",
	black = "#191a21",
	gray = "#2a2e36",
	red = "#ff5555",
	green = "#50fa7b",
	yellow = "#f1fa8c",
	blue = "#8be9fd",
	magenta = "#bd93f9",
	cyan = "#8be9fd",
	white = "#abb2bf",
	orange = "#ffb86c",
	pink = "#ff79c6",
	black_br = "#191a21",
	red_br = "#ff6e6e",
	green_br = "#69ff94",
	yellow_br = "#ffffa5",
	blue_br = "#d6acff",
	magenta_br = "#ff92df",
	cyan_br = "#a4ffff",
	white_br = "#ffffff",
	orange_br = "#ffb86c",
	pink_br = "#ff92df",
	comment = "#6272a4",
}

-- Some extra colors which require some util functions
colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
colors.fg_alt = util.darken(colors.fg, 0.80, "#000000")

colors.black = util.darken(colors.bg, 0.8, "#000000")

return colors
