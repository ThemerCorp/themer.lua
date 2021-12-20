local config = require("themer.config")("get")

---return a cleaned styles
---@param cp table
---@param cs string
---@return table
local function remap_styles(cp, cs)
	local groups = {
		styles = {
			comment = { fg = cp.subtle, style = "italic" },
			func = { fg = cp.blue },
			keyword = { fg = cp.magenta },
			string = { fg = cp.green },
			variable = { fg = cp.fg },
			parameter = { fg = cp.yellow },
			field = { fg = cp.red },
			punc = { fg = cp.subtle },
		},
		diagnostics = {
			colors = { -- Also can be used for stuff like TSError
				hint = cp.magenta,
				info = cp.blue,
				error = cp.red,
				warn = cp.yellow,
			},
		},
	}

	groups.diagnostics.virtual_text = {
		hint = { fg = groups.hint, style = "italic" },
		warn = { fg = groups.warn, style = "italic" },
		info = { fg = groups.info, style = "italic" },
		error = { fg = groups.error, style = "italic" },
	}

	groups.diagnostics.underlines = {
		hint = { sp = groups.hint, style = "undercurl" },
		warn = { sp = groups.warn, style = "undercurl" },
		info = { sp = groups.info, style = "undercurl" },
		error = { sp = groups.error, style = "undercurl" },
	}

	groups = vim.tbl_deep_extend("force", groups or {}, cp.groups or {}, config or {})
	return groups
end

---return the basic hig groups
---@param cp table
---@param cs string
---@return table
local function get_base(cp, cs)
	local groups = remap_styles(cp, cs)
	local maybe_transparent = config.transparent and "NONE" or cp.bg
	return {
		-- ---------------------
		-- ░█▀▄░█▀█░█▀▀░█▀▀
		-- ░█▀▄░█▀█░▀▀█░█▀▀
		-- ░▀▀░░▀░▀░▀▀▀░▀▀▀
		-- ---------------------

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
		EndOfBuffer = { bg = maybe_transparent },
		ErrorMsg = { fg = cp.red, style = "bold" },
		FloatBorder = { fg = cp.subtle },
		Folded = { fg = cp.fg, bg = maybe_transparent },
		IncSearch = { bg = cp.highlight },
		LineNr = { fg = cp.inactive },
		MatchParen = { fg = cp.fg, bg = cp.bg_float },
		-- ModeMsg = {},
		MoreMsg = { fg = cp.magenta },
		NonText = { fg = cp.inactive },
		Normal = { fg = cp.fg, bg = maybe_transparent },
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
		SpellBad = { style = "undercurl", sp = cp.red },
		SpellCap = { style = "undercurl", sp = cp.subtle },
		SpellLocal = { style = "undercurl", sp = cp.subtle },
		SpellRare = { style = "undercurl", sp = cp.subtle },
		SignColumn = { fg = cp.fg, bg = maybe_transparent },
		StatusLine = { fg = cp.fg, bg = cp.bg_alt },
		StatusLineNC = { fg = cp.subtle, bg = cp.bg_alt },
		-- StatusLineTerm = {},
		-- StatusLineTermNC = {},
		TabLine = { fg = cp.subtle, bg = cp.bg_float },
		TabLineFill = { bg = cp.bg_alt },
		TabLineSel = { fg = cp.fg, bg = cp.inactive },
		Title = { fg = cp.fg },
		VertSplit = { fg = cp.bg_alt, bg = cp.bg_alt },
		Visual = { bg = cp.highlight },
		-- VisualNOS = {},
		WarningMsg = { fg = cp.yellow },
		-- Whitespace = {},
		-- WildMenu = {},
		Boolean = { fg = cp.yellow },
		Character = { fg = cp.yellow },
		Comment = groups.styles.comment,
		Conditional = { fg = cp.blue },
		Constant = { fg = cp.yellow },
		Debug = { fg = cp.orange },
		Define = { fg = cp.magenta },
		Delimiter = { fg = cp.orange },
		Error = { fg = cp.red },
		Exception = { fg = cp.blue },
		Float = { fg = cp.yellow },
		Function = groups.styles.func,
		Identifier = groups.styles.variable,
		-- Ignore = { fg = '' },
		Include = { fg = cp.magenta },
		Keyword = groups.keyword,
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
		String = groups.string,
		Structure = { fg = cp.green },
		Tag = { fg = cp.orange },
		Todo = { fg = cp.magenta },
		Type = { fg = cp.green },
		Typedef = { fg = cp.green },
		Underlined = { fg = cp.green, style = "underline" },

		---------------------------------------
		-- ░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀
		-- ░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█
		-- ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
		---------------------------------------

		BufferTabpageFill = { bg = "NONE" },
		BufferCurrent = { fg = cp.fg, bg = cp.bg_float },
		BufferCurrentIndex = { fg = cp.fg, bg = cp.bg_float },
		BufferCurrentMod = { fg = cp.green, bg = cp.bg_float },
		BufferCurrentSign = { fg = cp.subtle, bg = cp.bg_float },
		BufferInactive = { fg = cp.subtle },
		BufferInactiveIndex = { fg = cp.subtle },
		BufferInactiveMod = { fg = cp.green },
		BufferInactiveSign = { fg = cp.subtle },
		BufferVisible = { fg = cp.subtle },
		BufferVisibleIndex = { fg = cp.subtle },
		BufferVisibleMod = { fg = cp.green },
		BufferVisibleSign = { fg = cp.subtle },

		BufferLineFill = { bg = cp.bg_float },
		BufferLineBackground = { fg = cp.subtle, bg = cp.inactive },
		BufferLineBufferVisible = { fg = cp.subtle, bg = cp.inactive },
		BufferLineBufferSelected = { fg = cp.fg, bg = cp.bg },
		BufferLineTab = { fg = cp.subtle, bg = cp.bg },
		BufferLineTabSelected = { fg = cp.red, bg = cp.blue },
		BufferLineTabClose = { fg = cp.red, bg = cp.inactive },
		BufferLineIndicatorSelected = { fg = cp.bg, bg = cp.bg },
		-- separators
		BufferLineSeparator = { fg = cp.inactive, bg = cp.inactive },
		BufferLineSeparatorVisible = { fg = cp.inactive, bg = cp.inactive },
		BufferLineSeparatorSelected = { fg = cp.inactive, bg = cp.inactive },
		-- close buttons
		BufferLineCloseButton = { fg = cp.subtle, bg = cp.inactive },
		BufferLineCloseButtonVisible = { fg = cp.subtle, bg = cp.inactive },
		BufferLineCloseButtonSelected = { fg = cp.red, bg = cp.bg },

		CmpItemKind = { fg = cp.magenta },
		CmpItemAbbr = { fg = cp.subtle },
		CmpItemAbbrMatch = { fg = cp.fg, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = cp.fg, style = "bold" },
		CmpItemAbbrDeprecated = { fg = cp.subtle, style = "strikethrough" },

		SignAdd = { fg = cp.green },
		SignChange = { fg = cp.orange },
		SignDelete = { fg = cp.red },
		GitSignsAdd = { fg = cp.green },
		GitSignsChange = { fg = cp.orange },
		GitSignsDelete = { fg = cp.red },

		IndentBlanklineChar = { fg = cp.gray, style = "nocombine" },
		IndentBlanklineIndent6 = { style = "nocombine", fg = cp.yellow },
		IndentBlanklineIndent5 = { style = "nocombine", fg = cp.red },
		IndentBlanklineIndent4 = { style = "nocombine", fg = cp.green },
		IndentBlanklineIndent3 = { style = "nocombine", fg = cp.orange },
		IndentBlanklineIndent2 = { style = "nocombine", fg = cp.blue },
		IndentBlanklineIndent1 = { style = "nocombine", fg = cp.magenta },

		LspReferenceText = { bg = cp.bg_alt },
		LspReferenceRead = { bg = cp.bg_alt },
		LspReferenceWrite = { bg = cp.bg_alt },
		DiagnosticError = { fg = groups.diagnostics.colors.error },
		DiagnosticWarn = { fg = groups.diagnostics.colors.warn },
		DiagnosticInfo = { fg = groups.diagnostics.colors.info },
		DiagnosticHint = { fg = groups.diagnostics.colors.hint },
		DiagnosticDefaultError = { fg = groups.diagnostics.colors.error },
		DiagnosticDefaultWarn = { fg = groups.diagnostics.colors.warn },
		DiagnosticDefaultInfo = { fg = groups.diagnostics.colors.info },
		DiagnosticDefaultHint = { fg = groups.diagnostics.colors.hint },
		DiagnosticFloatingError = { bg = cp.bg_alt, fg = groups.diagnostics.colors.error },
		DiagnosticFloatingWarn = { bg = cp.bg_alt, fg = groups.diagnostics.colors.warn },
		DiagnosticFloatingInfo = { bg = cp.bg_alt, fg = groups.diagnostics.colors.info },
		DiagnosticFloatingHint = { bg = cp.bg_alt, fg = groups.diagnostics.colors.hint },
		DiagnosticVirtualTextError = groups.diagnostics.virtual_text.error,
		DiagnosticVirtualTextWarn = groups.diagnostics.virtual_text.warn,
		DiagnosticVirtualTextInfo = groups.diagnostics.virtual_text.info,
		DiagnosticVirtualTextHint = groups.diagnostics.virtual_text.hint,
		DiagnosticUnderlineError = groups.diagnostics.underlines.error,
		DiagnosticUnderlineWarn = groups.diagnostics.underlines.warn,
		DiagnosticUnderlineInfo = groups.diagnostics.underlines.info,
		DiagnosticUnderlineHint = groups.diagnostics.underlines.hint,

		LspDiagnosticsError = { link = "DiagnosticError" },
		LspDiagnosticsWarning = { link = "DiagnosticWarn" },
		LspDiagnosticsInformation = { link = "DiagnosticInfo" },
		LspDiagnosticsHint = { link = "DiagnosticHint" },
		LspDiagnosticsDefaultError = { link = "DiagnosticDefaultError" },
		LspDiagnosticsDefaultWarning = { link = "DiagnosticDefaultWarn" },
		LspDiagnosticsDefaultInformation = { link = "DiagnosticDefaultInfo" },
		LspDiagnosticsDefaultHint = { link = "DiagnosticDefaultHint" },
		LspDiagnosticsFloatingError = { link = "DiagnosticFloatingError" },
		LspDiagnosticsFloatingWarning = { link = "DiagnosticFloatingWarn" },
		LspDiagnosticsFloatingInformation = { link = "DiagnosticFloatingInfo" },
		LspDiagnosticsFloatingHint = { link = "DiagnosticFloatingHint" },
		LspDiagnosticsVirtualTextError = { link = "DiagnosticVirtualTextError" },
		LspDiagnosticsVirtualTextWarning = { link = "DiagnosticVirtualTextWarn" },
		LspDiagnosticsVirtualTextInformation = { link = "DiagnosticVirtualTextInfo" },
		LspDiagnosticsVirtualTextHint = { link = "DiagnosticVirtualTextHint" },
		LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" },
		LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarn" },
		LspDiagnosticsUnderlineInformation = { link = "DiagnosticUnderlineInfo" },
		LspDiagnosticsUnderlineHint = { link = "DiagnosticUnderlineHint" },

		LspSignatureActiveParameter = { fg = cp.orange },
		LspCodeLens = { fg = cp.subtle },

		TelescopeBorder = { fg = cp.subtle },
		TelescopeSelectionCaret = { fg = cp.green },
		TelescopeSelection = { fg = cp.blue, bg = cp.highlight_overlay },
		TelescopeMatching = { fg = cp.yellow },

		-- TSAnnotation = {},
		-- TSAttribute = {},
		TSBoolean = { fg = cp.orange },
		-- TSCharacter = {},
		TSComment = groups.comment,
		TSNote = { fg = cp.bg, bg = groups.diagnostics.colors.info },
		TSWarning = { fg = cp.bg, bg = groups.diagnostics.colors.warn },
		TSDanger = { fg = cp.bg, bg = groups.diagnostics.colors.error },
		TSConditional = { fg = cp.red },
		TSConstBuiltin = { fg = cp.red },
		-- TSConstMacro = {},
		TSConstant = { fg = cp.orange },
		TSConstructor = { fg = cp.magenta },
		-- TSEmphasis = {},
		-- TSError = {},
		-- TSException = {},
		TSField = { fg = cp.red },
		-- TSFloat = {},
		TSFuncBuiltin = { fg = cp.blue },
		-- TSFuncMacro = {},
		TSFunction = groups.functions,
		TSInclude = { fg = cp.green },
		TSKeyword = groups.keywords,
		TSKeywordFunction = { fg = cp.magenta },
		TSKeywordOperator = { fg = cp.blue },
		TSLabel = { fg = cp.green },
		-- TSLiteral = {},
		-- TSMethod = {},
		-- TSNamespace = {},
		-- TSNone = {},
		-- TSNumber = {},
		TSOperator = { fg = cp.blue },
		TSParameter = groups.parameters,
		-- TSParameterReference = {},
		TSProperty = groups.field,
		TSPunctBracket = groups.punc,
		TSPunctDelimiter = groups.punc,
		TSPunctSpecial = groups.punc,
		-- TSRepeat = {},
		-- TSStrike = {},
		TSString = groups.string,
		TSStringEscape = { fg = cp.blue },
		-- TSStringRegex = {},
		-- TSSymbol = {},
		TSTag = { fg = cp.green },
		TSTagDelimiter = { fg = cp.subtle },
		TSText = { fg = cp.fg },
		-- TSTitle = {},
		-- TSType = {},
		-- TSTypeBuiltin = {},
		TSURI = { fg = cp.blue, style = "undercurl" },
		-- TSUnderline = {},
		TSVariable = groups.variable,
		TSVariableBuiltin = groups.variable,

		-----------------------------
		-- ░█░░░█▀█░█▀█░█▀▀░█▀▀
		-- ░█░░░█▀█░█░█░█░█░▀▀█
		-- ░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀
		-----------------------------

		htmlArg = { fg = cp.magenta },
		htmlEndTag = { fg = cp.subtle },
		htmlLink = { fg = cp.fg },
		htmlTag = { fg = cp.subtle },
		htmlTagN = { fg = cp.fg },
		htmlTagName = { fg = cp.green },

		markdownHeadingDelimiter = { fg = cp.subtle },
		markdownCode = { fg = cp.yellow },
		markdownCodeDelimiter = { fg = cp.green },
		markdownCodeBlock = { fg = cp.green },
		markdownH1 = { fg = cp.red, style = "bold" },
		markdownH2 = { fg = cp.red, style = "bold" },
		markdownLinkText = { fg = cp.red },
	}
end

--- return the final integrations table
--- @param cp table
--- @param cs string
--- @return table
local function get_hig_groups(cp, cs)
	local hig_groups = get_base(cp, cs)
	hig_groups = vim.tbl_deep_extend(
		"force",
		hig_groups or {},
		config.remaps.highlights.globals or {},
		cp.remaps or {},
		config.remaps.highlights[cs] or {}
	)

	return hig_groups
end

---get color scheme properties
---@param cp table
---@return table
local function get_properties(cp)
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
return setmetatable({}, { __call = function (_, cp, cs)
	local theme = {}
	theme.colors = cp
	theme.base = get_hig_groups(cp, cs)
	theme.properties = get_properties(cp)
	return theme
end})
