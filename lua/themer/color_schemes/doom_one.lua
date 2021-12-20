local util = require("themer.utils.colors")

local colors = {
	none = "NONE",
	bg = "#282c34", -- nvim bg
	highlight = "#21252a",
	highlight_overlay = "#21252a",
	highlight_inactive = "#21252a",
	fg = "#bbc2cf", -- fg color (text)
	subtle = "#5B6268",
	inactive = "#5B6268",
	bg_float = "#3f444a",
	red = "#ff6c6b",
	green = "#98be65",
	yellow = "#ECBE7B",
	blue = "#51afef",
	magenta = "#c678dd",
	white = "#efefef",
	orange = "#da8548",
}

-- Some extra colors which require some util functions
colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
colors.black = util.darken(colors.bg, 0.8, "#000000")

require("themer").setup({ colors = { comment = colors.comment } })
return colors
