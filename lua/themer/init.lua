local init = {}

--- Load the theme with given config and load installed themes
---@param opts table
init.setup = function(opts)
  opts = opts or {}
  require("themer.config")("user", opts)

  require("themer.modules.installer.load_installed").load_installed_themes()
end

return init
