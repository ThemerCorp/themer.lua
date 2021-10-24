local M = {}

function M.get(cp)
	return {
		TelescopeBorder = { fg = cp.blue },
		TelescopeSelectionCaret = { fg = cp.cyan },
		TelescopeSelection = { fg = cp.cyan, bg = cp.bg_highlight },
		TelescopeMatching = { fg = cp.blue },
	}
end

return M
