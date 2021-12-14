local config = require("themer.config").options

---@class mapper
local mapper = {}

---https://stackoverflow.com/a/1283608
---merge two tables
---@param t1 table
---@param t2 table
function mapper.__mergeTables(t1,t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

---return the basic hig groups
---@param cp table
---@return table
function mapper.__get_base(cp)
	local groups = require("themer.core.groups").get_groups(cp).styles

	local maybe_bold_vert_split = config.bold_vertical_split_line and { fg = cp.bg_alt, bg = cp.bg_alt }
		or { fg = cp.bg_float }

	local base = {
		ColorColumn = { bg = cp.highlight_overlay },
		Conceal = { bg = cp.none },
		-- Cursor = {},
		CursorColumn = { bg = cp.highlight },
		-- CursorIM = {},
		CursorLine = { bg = cp.highlight_inactive },
		CursorLineNr = { fg = cp.fg },
		DarkenedPanel = { bg = cp.bg_alt },
		DarkenedStatusline = { bg = cp.bg_alt },
		DiffAdd = { fg = cp.green },
		DiffChange = { fg = cp.orange },
		DiffDelete = { fg = cp.red },
		DiffText = { fg = cp.fg },
		Directory = { fg = cp.green, bg = cp.none },
		EndOfBuffer = { bg = config.transparency and "NONE" or cp.bg },
		ErrorMsg = { fg = cp.red, bold = true },
		FloatBorder = { fg = cp.subtle },
		Folded = { fg = cp.fg, bg = config.transparency and "NONE" or cp.bg_alt },
		IncSearch = { bg = cp.highlight },
		LineNr = { fg = cp.inactive },
		MatchParen = { fg = cp.fg, bg = cp.bg_float },
		-- ModeMsg = {},
		MoreMsg = { fg = cp.magenta },
		NonText = { fg = cp.inactive },
		Normal = { fg = cp.fg, bg = config.transparency and cp.none or cp.bg },
		NormalNC = { link = "Normal" },
		-- NormalFloat = {},
		Pmenu = { fg = cp.subtle, bg = cp.bg_alt },
		PmenuSbar = { bg = cp.bg_float },
		PmenuSel = { fg = cp.fg, bg = cp.bg_float },
		PmenuThumb = { bg = cp.inactive },
		Question = { fg = cp.yellow },
		-- QuickFixLine = {},
		Search = { fg = cp.magenta, bg = cp.highlight_overlay },
		SpecialKey = { fg = cp.green },
		SpellBad = { undercurl = true, sp = cp.red },
		SpellCap = { undercurl = true, sp = cp.subtle },
		SpellLocal = { undercurl = true, sp = cp.subtle },
		SpellRare = { undercurl = true, sp = cp.subtle },
		SignColumn = { fg = cp.fg, bg = config.transparency and "NONE" or cp.bg },
		StatusLine = { fg = cp.fg, bg = cp.bg_alt },
		StatusLineNC = { fg = cp.subtle, bg = cp.bg_alt },
		-- StatusLineTerm = {},
		-- StatusLineTermNC = {},
		TabLine = { fg = cp.subtle, bg = cp.bg_float },
		TabLineFill = { bg = cp.bg_alt },
		TabLineSel = { fg = cp.fg, bg = cp.inactive },
		Title = { fg = cp.fg },
		VertSplit = maybe_bold_vert_split,
		Visual = { bg = cp.highlight },
		-- VisualNOS = {},
		WarningMsg = { fg = cp.yellow },
		-- Whitespace = {},
		-- WildMenu = {},
		Boolean = { fg = cp.yellow },
		Character = { fg = cp.yellow },
		Comment = groups.comment,
		Conditional = { fg = cp.blue },
		Constant = { fg = cp.yellow },
		Debug = { fg = cp.orange },
		Define = { fg = cp.magenta },
		Delimiter = { fg = cp.orange },
		Error = { fg = cp.red },
		Exception = { fg = cp.blue },
		Float = { fg = cp.yellow },
		Function = groups.functions,
		Identifier = groups.variables,
		-- Ignore = { fg = '' },
		Include = { fg = cp.magenta },
		Keyword = groups.keywords,
		Label = { fg = cp.green },
		Macro = { fg = cp.magenta },
		Number = { fg = cp.yellow },
		Operator = { fg = cp.subtle },
		PreCondit = { fg = cp.magenta },
		PreProc = { fg = cp.magenta },
		Repeat = { fg = cp.blue },
		Special = { fg = cp.orange },
		SpecialChar = { fg = cp.orange },
		SpecialComment = { fg = cp.magenta },
		Statement = { fg = cp.blue },
		StorageClass = { fg = cp.green },
		String = groups.strings,
		Structure = { fg = cp.green },
		Tag = { fg = cp.orange },
		Todo = { fg = cp.magenta },
		Type = { fg = cp.green },
		Typedef = { fg = cp.green },
		Underlined = { fg = cp.green, underline = true },

		htmlArg = { fg = cp.magenta },
		htmlEndTag = { fg = cp.subtle },
		htmlLink = { fg = cp.fg },
		htmlTag = { fg = cp.subtle },
		htmlTagN = { fg = cp.fg },
		htmlTagName = { fg = cp.green },
	}

	return base
end

--- return the final integrations table
--- @param cp table
--- @param cs string
--- @return table
function mapper.__get_hig_groups(cp, cs)
	local hig_groups = mapper.__get_base(cp)
	local integrations = {}

	for integration in pairs(config.integrations) do
		if integration.enabled or integration then
            integrations = mapper.__mergeTables(integrations, require("themer.core.integrations." .. integration).get(cp))
        end
	end

	hig_groups = vim.tbl_deep_extend(
		"force",
		hig_groups,
		config.remaps.highlights.globals or {},
		config.remaps.highlights[cs] or {}
	)

    return hig_groups
end

---get color scheme properties
---@param cp table
---@return table
function mapper.__get_properties(cp)
	local props = {
		termguicolors = true,
		background = cp.flavour or "dark",
	}
	return props
end

---return theme table containing highlights
---@param cp table
---@param cs string
---@return table
function mapper.apply(cp, cs)
	local theme = {}
	theme.colors = cp
	theme.hig_groups = mapper.__get_hig_groups(cp, cs)
	theme.properties = mapper.__get_properties(cp)
	return theme
end

return mapper
