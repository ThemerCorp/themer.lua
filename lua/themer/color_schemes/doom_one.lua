local util = require('themer.utils.util')

local colors = {
    none = "NONE",
	bg = "#282c34", -- nvim bg
	bg_highlight = "#21252a",
	fg = "#bbc2cf", -- fg color (text)
	fg_gutter = "#5B6268",
	black = "#282c34",
	gray = "#3f444a",
	red = "#ff6c6b",
	green = "#98be65",
	yellow = "#ECBE7B",
	blue = "#51afef",
	magenta = "#c678dd",
	cyan = "#46D9FF",
	white = "#efefef",
	orange = "#da8548",
	pink = "#a9a1e1",
	black_br = "#282c34",
	red_br = "#ff6c6b",
	green_br = "#98be65",
	yellow_br = "#ECBE7B",
	blue_br = "#51afef",
	magenta_br = "#c678dd",
	cyan_br = "#46D9FF",
	white_br = "#efefef",
	orange_br = "#da8548",
	pink_br = "#a9a1e1",
	comment = "#bbc2cf",
}

-- Some extra colors which require some util functions
colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
colors.fg_alt = util.darken(colors.fg, 0.80, "#000000")

colors.black = util.darken(colors.bg, 0.8, "#000000")

return colors
