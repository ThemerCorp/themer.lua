--- @class api
local api = {}

--- returns the colorscheme array for the given colorscheme
--- @param cs string
api.get_color_scheme = function(cs)
    local ok, csc = pcall(require, table.concat({ "themer.color_schemes.", cs }))
    local remaps = require("themer.config").options.remaps.palette[cs] or {}
    if not ok then
        return {
            status = false,
            msg = "themer.lua: the colorscheme " .. cs .. "was not recognised",
        }
    end

    if not (next(remaps) == nil) then
        return { status = true, color_scheme = vim.tbl_deep_extend("force", csc, remaps) }
    else
        return { status = true, color_scheme = csc }
    end
end

return api
