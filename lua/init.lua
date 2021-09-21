local theme = require("base-16.theme")

--@param theme_name Name of theme
function {}.theme(theme_name)
	theme.load_theme(theme_name, true)
end

return {}

