local cmp = {}

cmp.get = function (cp)
	local hi = {
	CmpItemKind = { fg = cp.magenta },
	CmpItemAbbr = { fg = cp.subtle },
	CmpItemAbbrMatch = { fg = cp.fg, bold = true },
	CmpItemAbbrMatchFuzzy = { fg = cp.fg, bold = true },
	CmpItemAbbrDeprecated = { fg = cp.subtle, strikethrough = true },
	}
	return hi
end


return cmp
