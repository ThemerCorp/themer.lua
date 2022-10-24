local api = {}

---Returns the colorscheme array for the given colorscheme
---@param cs string
api.get_cp = function(cs)
  local ok, csc = pcall(require, "themer.modules.themes." .. cs)
  local config = require("themer.config").options
  local remaps = config.remaps.palette[cs] or {}
  local remaps_global = config.remaps.palette.globals or {}

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

  -- Expensive as fuck
  -- TODO: look for better way
  require("themer.utils.str").deep_replace(csc, "#0", csc.fg or "#ffffff")

  if not (next(remaps or remaps_global) == nil) then
    return vim.tbl_deep_extend("force", csc, remaps_global, remaps)
  else
    return csc
  end
end

return api
