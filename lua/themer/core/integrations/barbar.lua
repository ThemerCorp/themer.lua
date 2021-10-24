local util = require("themer.utils.util")

local hi = {}

function hi.get(cp)
	return {
		BufferCurrent = { bg = cp.fg_gutter, fg = cp.fg },
		BufferCurrentIndex = { bg = cp.fg_gutter, fg = cp.blue },
		BufferCurrentMod = { bg = cp.fg_gutter, fg = cp.yellow },
		BufferCurrentSign = { bg = cp.fg_gutter, fg = cp.blue },
		BufferCurrentTarget = { bg = cp.fg_gutter, fg = cp.red },
		BufferVisible = { bg = cp.bg_alt, fg = cp.fg },
		BufferVisibleIndex = { bg = cp.bg_alt, fg = cp.blue },
		BufferVisibleMod = { bg = cp.bg_alt, fg = cp.yellow },
		BufferVisibleSign = { bg = cp.bg_alt, fg = cp.blue },
		BufferVisibleTarget = { bg = cp.bg_alt, fg = cp.yellow },
		BufferInactive = { bg = cp.bg_alt, fg = cp.comment },
		BufferInactiveIndex = { bg = cp.bg_alt, fg = cp.comment },
		BufferInactiveMod = { bg = cp.bg_alt, fg = util.darken(cp.yellow, 0.7) },
		BufferInactiveSign = { bg = cp.bg_alt, fg = cp.blue },
		BufferInactiveTarget = { bg = cp.bg_alt, fg = cp.red },
		BufferTabpages = { bg = cp.bg_alt, fg = cp.none },
		BufferTabpage = { bg = cp.bg_alt, fg = cp.blue },
	}
end

return hi
