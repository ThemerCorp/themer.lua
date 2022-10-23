--- loads the colorscheme
--- @param cs string colorscheme name
local load = function(cs)
  local color_palette
  if type(cs) == "table" then
    color_palette = cs
  else
    color_palette = require("themer.modules.core.api").get_cp(cs)
  end
  if color_palette then
    require("themer.modules.core.utils").load_mapper_higs(require("themer.modules.core.mapper")(color_palette, cs), cs, color_palette)
  end
end

return load
