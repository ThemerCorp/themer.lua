--- loads the provided colorscheme or builtin colorscheme without second argument
--- @param cs string colorscheme name
--- @param cp table colorscheme
local load = function(cs, cp)
  local color_palette = cp or require("themer.modules.core.api").get_cp(cs)
  if not cp then cs = 'themer_' .. cs end
  if color_palette then
    require("themer.modules.core.utils").load_mapper_higs(require("themer.modules.core.mapper")(color_palette, cs), cs)
  end
end

return load
