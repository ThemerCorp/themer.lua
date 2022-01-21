--- loads the colorscheme
--- @param cs string colorscheme name
return function(cs)
    vim.g.colors_name = cs
    local color_palette = require("themer.modules.core.api").get_cp(cs)
    require("themer.modules.core.utils")(require("themer.modules.core.mapper")(color_palette, cs))
end
