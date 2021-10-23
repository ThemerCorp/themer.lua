local init = {}

--- init function to load themes
--- @param cs string
function init.load(cs)
	require("themer.main").load_colorscheme(cs)
end

function init.remap_colorscheme(colorscheme)
	colorscheme = colorscheme or {}
	local remaps_mod = require("themer.core.remaps")
	remaps_mod.set_cs_remaps(colorscheme)
end

function init.remap_hl_group(hl_group)
	hl_group = hl_group or {}
	local remaps_mod = require("themer.core.remaps")
	remaps_mod.set_hig_remaps(hl_group)
end

function init.setup(custom_opts)
	require("themer.config").set_options(custom_opts)
end

return init
