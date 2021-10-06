local load_functions = {}

--- init function to load themes
--- @param theme_name
function load_functions.load(theme_name)
	require("base-16.loader").main(theme_name) -- I could move that function here but... keep init.lua clean
end

return load_functions
