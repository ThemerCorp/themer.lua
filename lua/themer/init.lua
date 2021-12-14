local init = {}

--- load themes
--- @param cs string
function init.load(cs)
    require("themer.main").load_colorscheme(cs)
end

--- setup config
--- @param custom_opts table
function init.setup(custom_opts)
    require("themer.config").set_options(custom_opts)
end

return init
