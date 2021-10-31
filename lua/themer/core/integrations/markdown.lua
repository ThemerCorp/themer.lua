local hi = {}

function hi.get(cp)
	return {
		markdownHeadingDelimiter = { fg = cp.subtle },
		markdownCode = { fg = cp.yellow },
		markdownCodeDelimiter = { fg = cp.green },
		markdownCodeBlock = { fg = cp.green },
		markdownH1 = { fg = cp.red, bold = true },
		markdownH2 = { fg = cp.red, bold = true },
		markdownLinkText = { fg = cp.red },
	}
end

return hi
