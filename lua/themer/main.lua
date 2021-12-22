--- loads the colorscheme
--- @param cs string colorscheme name
return function(cs)
        vim.g.colors_name = cs
        local color_palette = require("themer.api.colors")(cs)
        require("themer.utils")(require("themer.core.mapper")(color_palette, cs))
    end
