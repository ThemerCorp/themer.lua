local remaps = {}
local hig_remaps -- highlight groups

---returns hig remaps
---@return table
function remaps.get_hig_remaps()
	local remapped_hig = hig_remaps
	hig_remaps = {}
	return remapped_hig
end

---remaps hig groups
---@param val table
function remaps.set_hig_remaps(val)
	hig_remaps = val
end

return remaps
