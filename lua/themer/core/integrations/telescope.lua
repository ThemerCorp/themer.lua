local hi = {}

function hi.get(cp)
	return {
		TelescopeBorder = { fg = cp.subtle },
		TelescopeSelectionCaret = { fg = cp.green },
		TelescopeSelection = { fg = cp.blue, bg = cp.highlight_overlay },
		TelescopeMatching = { fg = cp.yellow },
	}
end

return hi
