--- loads the colorscheme
--- @param cs string colorscheme name
return function(cs)
    local color_palette = require("themer.modules.core.api").get_cp(cs)
    if color_palette then
        require("themer.modules.core.utils").load_mapper_higs(require("themer.modules.core.mapper")(color_palette, cs), cs)
    end
end
