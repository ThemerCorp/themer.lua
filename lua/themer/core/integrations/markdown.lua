local M = {}

function M.get(cp)
	return {
		markdownHeadingDelimiter = { fg = cp.orange, bold = true },
		markdownCode = { fg = cp.cyan },
		markdownCodeBlock = { fg = cp.cyan },
		markdownH1 = { fg = cp.magenta, bold = true },
		markdownH2 = { fg = cp.blue, bold = true },
		markdownLinkText = { fg = cp.blue, underline = true },
	}
end

return M
