local init = {}

init.setup = function(opts)
  opts = opts or {}
  require("themer.config")("user", opts)
end

return init
