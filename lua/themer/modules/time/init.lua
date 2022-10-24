return function(colorscheme, options)
  local cs = colorscheme
  local _hr = tostring(os.date("*t").hour)
  for cs_time, cond in pairs(options.time) do
    for _, current_cond in ipairs(cond) do
      local from_to = require("themer.utils.str").split(current_cond, "-")
      if _hr >= from_to[1] and _hr < from_to[2] then
        cs = cs_time
      end
    end
  end
  return cs or colorscheme
end
