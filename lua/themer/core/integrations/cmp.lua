local cmp = {}

cmp.get = function (cp)
	local hi = { CmpItemKind = { fg = cp.magenta },
	CmpItemAbbr = { fg = cp.gray },
	CmpItemAbbrMatch = { fg = cp.fg_alt, bold = true },
	CmpItemAbbrMatchFuzzy = { fg = cp.fg_alt, bold = true },
	CmpItemAbbrDeprecated = { fg = cp.gray, strikethrough = true },}
	return hi
end


return cmp
