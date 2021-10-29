local hi = {}

function hi.get(cp)

	return {
		BufferLineFill = { bg = cp.overlay },
		BufferLineBackground = { fg = cp.subtle, bg = cp.inactive },
		BufferLineBufferVisible = { fg = cp.subtle, bg = cp.inactive },
		BufferLineBufferSelected = { fg = cp.fg, bg = cp.bg },
		BufferLineTab = { fg = cp.subtle, bg = cp.bg },
		BufferLineTabSelected = { fg = cp.red, bg = cp.blue },
		BufferLineTabClose = { fg = cp.red, bg = cp.inactive },
		BufferLineIndicatorSelected = { fg = cp.bg, bg = cp.bg },
		-- separators
		BufferLineSeparator = { fg = cp.inactive, bg = cp.inactive },
		BufferLineSeparatorVisible = { fg = cp.inactive, bg = cp.inactive },
		BufferLineSeparatorSelected = { fg = cp.inactive, bg = cp.inactive },
		-- close buttons
		BufferLineCloseButton = { fg = cp.subtle, bg = cp.inactive },
		BufferLineCloseButtonVisible = { fg = cp.subtle, bg = cp.inactive },
		BufferLineCloseButtonSelected = { fg = cp.red, bg = cp.bg },
	}
end

return hi
