local M = {}
local config = require("themer.config").options

function M.get(cp)
	return {
		GitSignsAdd = { fg = cp.blue, bg = config.transparency and cp.none or cp.bg }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = cp.yellow, bg = config.transparency and cp.none or cp.bg }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = cp.red, bg = config.transparency and cp.none or cp.bg }, -- diff mode: Deleted line |diff.txt|
	}
end

return M
