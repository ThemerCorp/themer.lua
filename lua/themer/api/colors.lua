--- returns the colorscheme array for the given colorscheme
--- @param cs string
return function(cs)
    local ok, csc = pcall(require, "themer.color_schemes." .. cs)
    local remaps = require("themer.config")("get").remaps.palette[cs] or {}

    if not ok then
        require("themer.log").error("Themer: the colorscheme " .. cs .. " was not recognised")
    end

    if not (next(remaps) == nil) then
        return vim.tbl_deep_extend("force", csc, remaps)
    else
        return csc
    end
end
