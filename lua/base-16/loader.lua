local loader = {}

-- This contains all available themes
-- setting bool to false will disable that theme
local available_themes = {
	["rose-pine"] = true,
	["everforest"] = true,
	["nord"] = true,
	["one-dark"] = true,
	["javacafe"] = true,
	["tokyonight"] = true,
}

--- checks if a theme exists then loads it using theme.lua and sets vim colorscheme variables
--- @param theme_name: string
--- @return theme and highlights
function loader.main(theme_name)
	-- Error if theme does not exist
	if not available_themes[theme_name] == true then
		error("No such theme: " .. theme_name)
	end

	-- Load the theme array
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = theme_name

	local theme = require("base-16.theme")
	local util = require("base-16.util")

	theme.load_terminal()

	for group, colors in pairs(theme.base) do
		util.highlight(group, colors)
	end

	for group, colors in pairs(theme.treesitter) do
		util.highlight(group, colors)
	end

	for group, colors in pairs(theme.plugins) do
		util.highlight(group, colors)
	end
end

return loader
