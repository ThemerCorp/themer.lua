local hig = {}

function hig.get(cp)

	local hi = {
		IndentBlanklineChar = { fg = cp.gray },
	}

	if require("themer.config").options.integrations.indent_blankline.colored_indent_levels then
		hi["IndentBlanklineIndent6"] = {nocombine = true, fg = cp.yellow}
		hi["IndentBlanklineIndent5"] = {nocombine = true, fg = cp.red}
		hi["IndentBlanklineIndent4"] = {nocombine = true, fg = cp.green}
		hi["IndentBlanklineIndent3"] = {nocombine = true, fg = cp.orange}
		hi["IndentBlanklineIndent2"] = {nocombine = true, fg = cp.blue}
		hi["IndentBlanklineIndent1"] = {nocombine = true, fg = cp.magenta}
	end

	return hi
end

return hig
