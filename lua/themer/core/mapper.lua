local config = require("themer.config")("get")

---@return table a cleaned styles
---@param cp table
---@return table
local function remap_styles(cp)
	local groups = {
		heading = {
			h1 = { style = "bold", fg = cp.heading.h1 },
			h2 = { style = "bold", fg = cp.heading.h2 },
			h3 = { style = "bold", fg = cp.heading.h3 },
			h4 = { style = "bold", fg = cp.heading.h4 },
			h5 = { style = "bold", fg = cp.heading.h5 },
			h6 = { style = "bold", fg = cp.heading.h6 },
		},
		["function"] = { fg = cp.syntax["function"] },
		functionBuiltIn = { fg = cp.built_in["function"] },
		variable = { fg = cp.syntax.variable },
		variableBuiltIn = { fg = cp.built_in.variable },
		include = { fg = cp.syntax.include },
		keyword = { fg = cp.syntax.keyword },
		keywordBuiltIn = { fg = cp.built_in.keyword },
		struct = { fg = cp.syntax.struct },
		string = { fg = cp.syntax.string },
		parameter = { fg = cp.syntax.parameter },
		field = { fg = cp.syntax.field },
		type = { fg = cp.syntax.type },
		typeBuiltIn = { fg = cp.built_in.type },
		property = { fg = cp.syntax.property or cp.syntax.variable },
		punctuation = { fg = cp.syntax.punctuation },
		constructor = { fg = cp.syntax.constructor or cp.syntax.punctuation },
		operator = { fg = cp.syntax.operator or cp.sytax.punctuation },
		puncDelimiter = { fg = cp.syntax.punc_delimiter or cp.syntax.punctuation },
		constant = { fg = cp.syntax.constant },
		constantBuiltIn = { fg = cp.built_in.constant },
		todo = { fg = cp.syntax.todo },
		character = { fg = cp.syntax.character },
		conditional = { fg = cp.syntax.conditional },
		number = { fg = cp.syntax.number },
		statement = { fg = cp.syntax.statement },
		uri = { fg = cp.uri, style = "underline" },
		diagnostics = {
			underline = {

				error = { fg = cp.diagnostics.error, style = "undercurl" },
				warn = { fg = cp.diagnostics.warn, style = "undercurl" },
				info = { fg = cp.diagnostics.info, style = "undercurl" },
				hint = { fg = cp.diagnostics.hint, style = "undercurl" },
			},
			virtual_text = {

				error = { fg = cp.diagnostics.error, style = "italic" },
				warn = { fg = cp.diagnostics.warn, style = "italic" },
				info = { fg = cp.diagnostics.info, style = "italic" },
				hint = { fg = cp.diagnostics.hint, style = "italic" },
			},
		},
	}
	groups = vim.tbl_deep_extend("force", groups, cp.groups or {}, config.styles or {})
	return groups
end

---@return table hig groups
---@param cp table
---@return table
local function get_base(cp)
	local groups = remap_styles(cp)

	-- Transparent
	cp.bg.base = config.transparency and "NONE" or cp.bg.base
	cp.bg.alt = config.transparency and "NONE" or cp.bg.base

	local themer = {
		-- base groups
		ThemerAccent = { fg = cp.accent },
		ThemerAccentFloat = { fg = cp.accent, bg = cp.bg.alt },
		ThemerFloat = { bg = cp.bg.alt },
		ThemerMatch = { fg = cp.match, style = "bold" },
		ThemerText = { fg = cp.fg, bg = cp.bg.base },
		ThemerTextFloat = { fg = cp.fg, bg = cp.bg.alt },

		-- search terms
		ThemerSearchResult = cp.search_result,
		ThemerMatchingSearchResult = cp.search_result, -- see :h hlsearch and do :set hlserch to see it in action

		-- git diffs
		DiffAdd = { bg = cp.diff.add },
		DiffChange = { bg = cp.diff.change },
		DiffText = { bg = cp.diff.text or cp.fg },
		DiffDelete = { bg = cp.diff.delete },

		-- syntax highlighting
		ThemerFunction = groups["function"],
		ThemerFunctionBuiltIn = groups.functionBuiltIn,
		ThemerVariable = groups.variable,
		ThemerVariableBuiltIn = groups.variableBuiltIn,
		ThemerInclude = groups.include,
		ThemerKeyword = groups.keyword,
		ThemerKeywordBuiltIn = groups.keywordBuiltIn,
		ThemerStruct = groups.struct,
		ThemerString = groups.string,
		ThemerParameter = groups.parameter,
		ThemerField = groups.field,
		ThemerType = groups.type,
		ThemerTypeBuiltIn = groups.typeBuiltIn,
		ThemerProperty = groups.property,
		ThemerPunctuation = groups.punctuation,
		ThemerConstructor = groups.constructor,
		ThemerOperator = groups.operator,
		ThemerPuncDelimiter = groups.puncDelimiter,
		ThemerConstant = groups.constant,
		ThemerConstantBuiltIn = groups.constantBuiltIn,
		ThemerTodo = groups.todo,
		ThemerCharacter = groups.character,
		ThemerConditional = groups.conditional,
		ThemerPreProc = { fg = cp.syntax.preproc },
		ThemerNumber = groups.number,
		ThemerStatement = groups.statement,

		-- helpful groups
		ThemerSubtle = { fg = cp.dimmed.subtle },
		ThemerSubtleFloat = { fg = cp.dimmed.subtle, bg = cp.bg.alt },
		ThemerDimmed = { fg = cp.dimmed.inactive },
		ThemerDimmedFloat = { fg = cp.dimmed.inactive, bg = cp.bg.alt },
		ThemerBorder = { fg = cp.border, bg = cp.bg.alt },
		ThemerURI = groups.uri,

		-- headings
		ThemerHeadingH1 = groups.heading.h1,
		ThemerHeadingH2 = groups.heading.h2,
		ThemerHeadingH3 = groups.heading.h3,
		ThemerHeadingH4 = groups.heading.h4,
		ThemerHeadingH5 = groups.heading.h5,
		ThemerHeadingH6 = groups.heading.h6,
	}
	-- ---------------------
	-- ░█▀▄░█▀█░█▀▀░█▀▀
	-- ░█▀▄░█▀█░▀▀█░█▀▀
	-- ░▀▀░░▀░▀░▀▀▀░▀▀▀
	-- ---------------------
	local base = {
		ColorColumn = { link = "ThemerFloat" },
		Conceal = { bg = cp.conceal or "NONE" },
		Cursor = { style = "reverse" },
		CursorColumn = { link = "ThemerFloat" },
		CursorIM = { style = "reverse" },
		CursorLine = { link = "ThemerSelected" },
		CursorLineNr = { link = "ThemerText" },
		DarkenedPanel = { link = "ThemerFloat" },
		DarkenedStatusline = { link = "ThemerFloat" },
		Directory = { link = "ThemerAccent" },
		EndOfBuffer = { link = "ThemerText" },
		ErrorMsg = { fg = cp.diagnostics.error, style = "bold" },
		FloatBorder = { link = "ThemerSubtle" },
		Folded = { link = "ThemerText" },
		IncSearch = { link = "Themer" },
		LineNr = { link = "ThemerDimmed" },
		MatchParen = { link = "ThemerTextFloat" },
		-- ModeMsg = {},
		MoreMsg = { link = "ThemerAccent" },
		NonText = { link = "ThemerDimmed" },
		Normal = { link = "ThemerText" },
		NormalNC = { link = "ThemerText" },
		NormalFloat = { link = "ThemerTextFloat" },
		Pmenu = { fg = cp.pum.fg or cp.dimmed.subtle, bg = cp.pum.bg or cp.bg.alt },
		PmenuSbar = { bg = cp.pum.sbar or cp.bg.selected },
		PmenuSel = { link = "ThemerSearchResult" },
		PmenuThumb = { bg = cp.pum.thumb or cp.dimmed.subtle },
		Question = { link = "ThemerAccent" },
		-- QuickFixLine = {},
		Search = { link = "ThemerMatchingSearchResult" },
		SpecialKey = { link = "ThemerAccent" },
		SpellBad = { style = "undercurl", sp = cp.red },
		SpellCap = { style = "undercurl", sp = cp.subtle },
		SpellLocal = { style = "undercurl", sp = cp.subtle },
		SpellRare = { style = "undercurl", sp = cp.subtle },
		SignColumn = { link = "ThemerText" },
		StatusLine = { link = "ThemerTextFloat" },
		StatusLineNC = { link = "ThemerSubtleFloat" },
		-- StatusLineTerm = {},
		-- StatusLineTermNC = {},
		TabLine = { link = "ThemerTextFloat" },
		TabLineFill = { link = "ThemerFloat" },
		TabLineSel = { link = "ThemerSelection" },
		Title = { link = "ThemerText" },
		VertSplit = { fg = cp.bg.alt, bg = cp.bg.alt },
		Visual = { link = "ThemerSelected" },
		-- VisualNOS = {},
		WarningMsg = { fg = cp.diagnostics.warn },
		-- Boolean = { link = "ThemerConstant" },
		Character = { link = "ThemerCharacter" },
		Comment = { link = "ThemerSubtle" },
		Conditional = { link = "ThemerConditional" },
		Constant = { link = "ThemerConstant" },
		-- Debug = { fg = cp.debug },
		-- Define = { fg = cp.magenta },
		Delimiter = { link = "ThemerPuncDelimiter" },
		Error = { fg = cp.diagnostics.error },
		-- Exception = { fg = cp.blue },
		Float = { link = "ThemerNumber" },
		Function = { link = "ThemerFunction" },
		Identifier = { link = "ThemerVariable" },
		Include = { link = "ThemerInclude" },
		Keyword = { link = "ThemerKeyword" },
		Number = { link = "ThemerNumber" },
		Operator = { link = "ThemerOperator" },
		PreProc = { link = "ThemerPreProc" },
		Special = { link = "ThemerAccent" },
		Statement = { link = "ThemerStatement" },
		String = { link = "ThemerString" },
		Todo = { link = "ThemerTodo" },
		Type = { link = "ThemerType" },
		Typedef = { link = "ThemerType" },
		Underlined = { fg = cp.accent, style = "underline" },
	}

	---------------------------------------
	-- ░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀
	-- ░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█
	-- ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
	---------------------------------------

	local plugins = {}

	local availablePlugins = {
		cmp = {
			CmpDocumentation = { link = "ThemerTextFloat" },
			CmpDocumentationBorder = { link = "ThemerBorder" },

			CmpItemAbbr = { link = "ThemerTextFloat" },
			CmpItemAbbrDeprecated = { fg = cp.fg, bg = "NONE", style = "strikethrough" },
			CmpItemAbbrMatch = { link = "ThemerMatch" },
			CmpItemAbbrMatchFuzzy = { link = "ThemerMatch" },

			CmpItemKindDefault = { link = "ThemerSubtleFloat" },
			CmpItemMenu = { link = "ThemerDimmedFloat" },

			CmpItemKindKeyword = { link = "ThemerKeyword" },

			CmpItemKindVariable = { link = "ThemerVariable" },
			CmpItemKindConstant = { link = "ThemerConstant" },
			CmpItemKindReference = { link = "ThemerInclude" },

			CmpItemKindFunction = { link = "ThemerFunction" },
			CmpItemKindMethod = { link = "ThemerFunction" },
			CmpItemKindConstructor = { link = "ThemerConstructor" },

			CmpItemKindClass = { link = "ThemerStruct" },
			CmpItemKindInterface = { link = "ThemerStruct" },
			CmpItemKindStruct = { link = "ThemerStruct" },
			CmpItemKindEvent = { link = "ThemerStruct" },
			CmpItemKindEnum = { link = "ThemerStruct" },
			CmpItemKindUnit = { link = "ThemerStruct" },

			CmpItemKindModule = { link = "ThemerInclude" },

			CmpItemKindProperty = { link = "ThemerProperty" },
			CmpItemKindField = { link = "ThemerField" },
			CmpItemKindTypeParameter = { link = "ThemerParameter" },
			CmpItemKindEnumMember = { link = "ThemerVariable" },
			CmpItemKindOperator = { link = "ThemerOperator" },
			CmpItemKindSnippet = { link = "ThemerSubtle" },
		},

		indentline = {
			IndentBlanklineChar = { fg = cp.dimmed.subtle, style = "nocombine" },
			IndentBlanklineContextChar = { fg = cp.accent, style = "nocombine" },
			IndentBlanklineSpaceChar = { link = "IndentBlanklineChar" },
			IndentBlanklineSpaceCharBlankline = { link = "IndentBlanklineChar" },
			IndentBlanklineContextStart = { style = "underline", sp = cp.accent },
		},

		lsp = {
			LspReferenceText = { link = "ThemerFloat" },
			LspReferenceRead = { link = "ThemerFloat" },
			LspReferenceWrite = { link = "ThemerFloat" },
			DiagnosticError = { fg = cp.diagnostics.error },
			DiagnosticWarn = { fg = cp.diagnostics.warn },
			DiagnosticInfo = { fg = cp.diagnostics.info },
			DiagnosticHint = { fg = cp.diagnostics.hint },
			DiagnosticSignError = { link = "DiagnosticHint" },
			DiagnosticSignWarn = { link = "DiagnosticWarn" },
			DiagnosticSignInfo = { link = "DiagnosticInfo" },
			DiagnosticSignHint = { link = "DiagnosticHint" },

			DiagnosticDefaultError = { link = "DiagnosticHint" },
			DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
			DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
			DiagnosticDefaultHint = { link = "DiagnosticHint" },
			DiagnosticUnderlineError = groups.diagnostics.underline.error,
			DiagnosticUnderlineWarn = groups.diagnostics.underline.warn,
			DiagnosticUnderlineInfo = groups.diagnostics.underline.info,
			DiagnosticUnderlineHint = groups.diagnostics.underline.hint,
			DiagnosticVirtualTextError = groups.diagnostics.virtual_text.error,
			DiagnosticVirtualTextWarn = groups.diagnostics.virtual_text.warn,
			DiagnosticVirtualTextInfo = groups.diagnostics.virtual_text.info,
			DiagnosticVirtualTextHint = groups.diagnostics.virtual_text.hint,

			LspSignatureActiveParameter = { link = "DiagnosticWarn" },
			LspCodeLens = { link = "ThemerSubtle" },
		},

		telescope = {
			TelescopeBorder = { link = "ThemerBorder" },
			TelescopeSelection = { link = "ThemerSelection" },
			TelescopeMatching = { link = "ThemerMatch" },
			TelescopeNormal = { link = "ThemerTextFloat" },
		},

		treesitter = {
			-- TSAnnotation = {},
			-- TSAttribute = {},
			-- TSBoolean = { fg = cp.orange },
			-- TSCharacter = {},
			-- TSComment = groups.styles.comment,
			TSNote = { link = "DiagnosticInfo" },
			TSWarning = { link = "DiagnosticWarn" },
			TSDanger = { link = "DiagnosticError" },
			TSConditional = { link = "ThemerConditional" },
			TSConstBuiltin = { link = "ThemerConstantBuiltIn" },
			-- TSConstMacro = {},
			TSConstant = { link = "ThemerConstant" },
			TSConstructor = { link = "ThemerConstructor" },
			-- TSEmphasis = {},
			-- TSError = {},
			-- TSException = {},
			TSField = { link = "ThemerField" },
			-- TSFloat = {},
			TSFuncBuiltin = { link = "ThemerFunctionBuiltIn" },
			-- TSFuncMacro = {},
			TSFunction = { link = "ThemerFunction" },
			TSInclude = { link = "ThemerInclude" },
			TSKeyword = { link = "ThemerKeyword" },
			TSKeywordFunction = { link = "ThemerKeywordBuiltIn" },
			TSKeywordOperator = { link = "ThemerOperator" },
			-- TSLabel = {},
			-- TSLiteral = {},
			-- TSMethod = {},
			-- TSNamespace = {},
			-- TSNone = {},
			-- TSNumber = {},
			TSOperator = { link = "ThemerOperator" },
			TSParameter = { link = "ThemerParameter" },
			-- TSParameterReference = {},
			TSProperty = { link = "ThemerProperty" },
			TSPunctBracket = { link = "ThemerPunctuation" },
			TSPunctDelimiter = { link = "ThemerPunctuation" },
			TSPunctSpecial = { link = "ThemerPunctuation" },
			-- TSRepeat = {},
			-- TSStrike = {},
			TSString = { link = "ThemerString" },
			-- TSStringEscape = { fg = cp.blue },
			-- TSStringRegex = {},
			-- TSSymbol = {},
			-- TSTag = { fg = cp.green },
			TSTagDelimiter = { link = "ThemerSubtle" },
			TSText = { link = "ThemerText" },
			TSTitle = { link = "ThemerHeadingH1" },
			TSType = { link = "ThemerType" },
			TSTypeBuiltin = { link = "ThemerTypeBuiltIn" },
			TSURI = { link = "ThemerURI" },
			-- TSUnderline = {},
			TSVariable = { link = "ThemerVariable" },
			TSVariableBuiltin = { link = "ThemerVariableBuiltIn" },
			commentTSDanger = { link = "DiagnosticError" },
			commentTSNote = { link = "ThemerTodo" },
			commentTSWarning = { link = "DiagnosticWarn" },
		},
	}

	-----------------------------
	-- ░█░░░█▀█░█▀█░█▀▀░█▀▀
	-- ░█░░░█▀█░█░█░█░█░▀▀█
	-- ░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀
	-----------------------------

	local langs = {}

	local availableLangs = {
		html = {
			htmlH2 = { link = "ThemerHeadingH2" },
			htmlH1 = { link = "ThemerHeadingH1" },
			htmlH3 = { link = "ThemerHeadingH3" },
			htmlH4 = { link = "ThemerHeadingH4" },
			htmlH5 = { link = "ThemerHeadingH5" },
			htmlH6 = { link = "ThemerHeadingH6" },
			htmlLink = { link = "ThemerURI" },
			htmlBold = { fg = cp.fg, style = "bold" },
			htmlBoldUnderline = { fg = cp.fg, style = "bold,underline" },
			htmlBoldItalic = { fg = cp.fg, style = "bold,italic" },
			htmlBoldUnderlineItalic = { fg = cp.fg, style = "italic,bold,underline" },
			htmlUnderline = { fg = cp.fg, style = "underline" },
			htmlUnderlineItalic = { fg = cp.fg, style = "underline,italic" },
			htmlItalic = { fg = cp.fg, style = "italic" },
			htmlTag = { link = "ThemerField" },
			htmlEndTag = { link = "ThemerField" },
			htmlTagN = { link = "ThemerKeyword" },
			htmlTagName = { link = "ThemerKeyword" },
			htmlString = { link = "ThemerString" },
		},

		md = {
			markdownLinkText = { link = "ThemerURI" },
			markdownH2 = { link = "ThemerHeadingH2" },
			markdownH1 = { link = "ThemerHeadingH1" },
			markdownCodeBlock = { link = "ThemerInclude" },
			markdownCode = { link = "ThemerInclude" },
			markdownUrl = { link = "ThemerURI" },
			markdownH3 = { link = "ThemerHeadingH3" },
			markdownH4 = { link = "ThemerHeadingH4" },
			markdownH5 = { link = "ThemerHeadingH5" },
			markdownH6 = { link = "ThemerHeadingH6" },
			markdownItalic = { fg = cp.fg, style = "italic" },
			markdownBold = { fg = cp.fg, style = "bold" },
			markdownBoldDelimiter = { link = "" },
		},
	}

	for lang, isEnabled in pairs(config.langs) do
		if isEnabled then
			langs[lang] = availableLangs[lang] or {}
		end
	end

	for plugin, isEnabled in pairs(config.plugins) do
		if isEnabled then
			plugins[plugin] = availablePlugins[plugin] or {}
		end
	end

	return {
		themer = themer,
		base = base,
		plugins = plugins,
		langs = langs,
	}
end

--- @return table the final integrations table
--- @param cp table
--- @param cs string
--- @return table
local function get_hig_groups(cp, cs)
	local hig_groups = get_base(cp)
	hig_groups = vim.tbl_deep_extend(
		"force",
		hig_groups or {},
		config.remaps.highlights.globals or {},
		cp.remaps or {},
		config.remaps.highlights[cs] or {}
	)

	return hig_groups
end

---@return table color scheme properties
---@param cp table
local function get_properties(cp)
	local props = {
		termguicolors = true,
		background = cp.flavour or "dark",
	}
	return props
end

---@return table theme table containing highlights
---@param cp table
---@param cs string
---@return table
return function(cp, cs)
	local theme = {}
	theme.colors = cp
	theme.hig_groups = get_hig_groups(cp, cs)
	theme.properties = get_properties(cp)
	return theme
end
