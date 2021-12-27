--- returns the colorscheme array for the given colorscheme
--- @param cs string
return function(cs)
    local ok, csc = pcall(require, "themer.color_schemes." .. cs)
    local remaps = require("themer.config")("get").remaps.palette[cs] or {}

    if not ok then
        require("themer.log")(
            string.format(
                "Colorscheme %s was not recognised\nPlease check the theme name for typos\n\nIf this is a bug, report it at https://github.com/narutoxy/themer.lua",
                cs
            ),
            "error",
            "themer.lua"
        )
    end

    if not (next(remaps) == nil) then
        return vim.tbl_deep_extend("force", csc, remaps)
    else
        return csc
    end
end
