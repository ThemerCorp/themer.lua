local colors = require("themer.utils.json").decode("../color_schemes/json/papa_dark.json")
require("themer").setup({
	colors = {
		comment = colors.comment,
		punctuation = colors.light_blue,
	},
	styles = {
		keywords = { fg = colors.blue },
		variables = { fg = colors.cyan },
		parameters = { fg = colors.blue },
		string = { fg = colors.string },
		functions = { fg = colors.light_blue },
	},
})

return colors
