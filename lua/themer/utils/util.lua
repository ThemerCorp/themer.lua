--- @class util
local util = {}
local g = vim.g
local ns = vim.api.nvim_create_namespace('themer')

util.bg = "#000000"
util.fg = "#ffffff"
util.brightness = 0.3

---@param hex string hexadecimal value of a color
function util.hex2rgb(hex)
    hex = hex:gsub("#","")
    return {tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))}
end


-- Credits to Pocco81 for these blend, darken, and lighten functions
-- https://github.com/Pocco81/Catppuccino.nvim

--@param fg string
--@param bg string
--@param alpha number
function util.blend(fg, bg, alpha)
	bg = util.hex2rgb(bg)
	fg = util.hex2rgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg)
	return util.blend(hex, bg or util.bg, math.abs(amount))
end

function util.lighten(hex, amount, fg)
	return util.blend(hex, fg or util.fg, math.abs(amount))
end

function util.highlight(group, color)
	-- Doc: :h highlight-gui
	local fg = color.fg and table.concat({"guifg=",color.fg}) or "guifg=NONE"
	local bg = color.bg and table.concat({"guibg=",color.bg}) or "guibg=NONE"
	local hl = table.concat({"highlight",group,fg,bg}, " ")

	vim.cmd(hl)
end

---sets highlights
---@param hl_group string kinda?
---@param hl_value table
function util.set_hl(hl_group, hl_value)
	vim.api.nvim_set_hl(ns, hl_group, hl_value)
end

function util.check_change()
	vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
	vim.api.nvim__set_hl_ns(0)
end
--- Highlight on basis of given group and color
--- @param tbl table
function util.syntax(tbl)
	for hl_group, hl_value in pairs(tbl) do
		util.set_hl(hl_group, hl_value)
	end
end

--- @param tbl table
function util.properties(tbl)
	for property, value in pairs(tbl) do
		vim.o[property] = value
	end
end

--- Set terminal colors
--- @param clrs table
function util.terminal(clrs)
	g.terminal_color_0 = clrs.black
	g.terminal_color_1 = clrs.red
	g.terminal_color_2 = clrs.green
	g.terminal_color_3 = clrs.yellow
	g.terminal_color_4 = clrs.blue
	g.terminal_color_5 = clrs.magenta
	g.terminal_color_6 = clrs.cyan
	g.terminal_color_7 = clrs.white

	g.terminal_color_8 = clrs.black_br
	g.terminal_color_9 = clrs.red_br
	g.terminal_color_10 = clrs.green_br
	g.terminal_color_11 = clrs.yellow_br
	g.terminal_color_12 = clrs.blue_br
	g.terminal_color_13 = clrs.magenta_br
	g.terminal_color_14 = clrs.cyan_br
	g.terminal_color_15 = clrs.white_br
end

--- load a given theme
--- @param theme table
function util.load(theme)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	util.properties(theme.properties)
	util.syntax(theme.base)
	util.syntax(theme.integrations)
	util.highlight("Normal", theme.base.Normal)

	if require("themer.config").options["term_colors"] then
		util.terminal(theme.colors)
	end
	
	vim.cmd [[au ColorSchemePre * :lua require("themer.utils.util").check_change()]]
	vim.api.nvim__set_hl_ns(ns)
end

return util
