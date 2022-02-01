local api = {}

--- returns the colorscheme array for the given colorscheme
--- @param cs string
api.get_cp = function(cs)
    local ok, csc = pcall(require, "themer.modules.themes." .. cs)
    local remaps = require("themer.config")("get").remaps.palette[cs] or {}

    if not ok then
        vim.notify(
            string.format(
                [[Colorscheme %s was not recognised
Please check the theme name for typos

If this is a bug, report it at https://github.com/narutoxy/themer.lua]],
                cs
            ),
            vim.log.levels.ERROR
        )
        return false
    end

    if not (next(remaps) == nil) then
        return vim.tbl_deep_extend("force", csc, remaps)
    else
        return csc
    end
end

return api
