local remaps = {}

local cs_remaps -- colorscheme
local hig_remaps -- highlight groups

---returns color remaps
---@return table
function remaps.get_cs_remaps()
    return cs_remaps
end

---remaps colorscheme
---@param val table
function remaps.set_cs_remaps(val)
    cs_remaps = val
end

---returns hig remaps
---@return table
function remaps.get_hig_remaps()
    return hig_remaps
end

---remaps hig groups
---@param val table
function remaps.set_hig_remaps(val)
    hig_remaps = val
end

return remaps
