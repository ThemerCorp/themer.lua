--- @class theme
local theme = {}
local p = require("base-16.themes." .. vim.g.colors_name)
local maybe_base = p.base00
local maybe_italic = "italic"

if vim.o.background == "light" and vim.g.base16_variant == nil then
	vim.g.base16_variant = "dawn"
elseif vim.g.base16_variant == "light" then
	vim.o.background = "light"
end

if vim.g.base16_disable_background then
	maybe_base = "NONE"
end

if vim.g.base16_disable_italics then
	maybe_italic = nil
end

theme.base = {
	ColorColumn = { bg = p.base01 },
	Conceal = { bg = "NONE" },
	-- Cursor = {},
	CursorColumn = { bg = p.base01 },
	-- CursorIM = {},
	CursorLine = { bg = p.base01 },
	CursorLineNr = { fg = p.base05 },
	DarkenedPanel = { bg = p.base01 },
	DarkenedStatusline = { bg = p.base01 },
	DiffAdd = { fg = p.base0D },
	DiffChange = { fg = p.base0B },
	DiffDelete = { fg = p.base09 },
	DiffText = { fg = p.base05 },
	Directory = { fg = p.base0D, bg = "NONE" },
	-- EndOfBuffer = {},
	ErrorMsg = { fg = p.base09, style = "bold" },
	FloatBorder = { fg = p.base04, bg = p.base01 },
	FoldColumn = {},
	Folded = { fg = p.base05, bg = p.base01 },
	IncSearch = { fg = p.base08, bg = p.base02 },
	LineNr = { fg = p.base03 },
	MatchParen = { fg = p.base05, bg = p.base02 },
	-- ModeMsg = {},
	MoreMsg = { fg = p.base0E },
	NonText = { fg = p.base03 },
	Normal = { fg = p.base05, bg = maybe_base },
	-- NormalFloat = {},
	Pmenu = { fg = p.base04, bg = p.base01 },
	PmenuSbar = { bg = p.base02 },
	PmenuSel = { fg = p.base05, bg = p.base02 },
	PmenuThumb = { bg = p.base03 },
	Question = { fg = p.base0A },
	-- QuickFixLine = {},
	Search = { fg = p.base08, bg = p.base02 },
	SpecialKey = { fg = p.base0D },
	SpellBad = { style = "undercurl", sp = p.base09 },
	SpellCap = { style = "undercurl", sp = p.base04 },
	SpellLocal = { style = "undercurl", sp = p.base04 },
	SpellRare = { style = "undercurl", sp = p.base04 },
	SignColumn = { fg = p.base05, bg = maybe_base },
	StatusLine = { fg = p.base05, bg = p.base01 },
	StatusLineNC = { fg = p.base04, bg = p.base01 },
	-- StatusLineTerm = {},
	-- StatusLineTermNC = {},
	-- TabLine = {},
	-- TabLineFill = {},
	-- TabLineSel = {},
	Title = { fg = p.base0B },
	VertSplit = { fg = p.base02 },
	Visual = { bg = p.base02 },
	-- VisualNOS = {},
	WarningMsg = { fg = p.base0A },
	-- Whitespace = {},
	-- WildMenu = {},

	Boolean = { fg = p.base0A },
	Character = { fg = p.base0A },
	Comment = {
		fg = p.base03,
		style = maybe_italic,
	},
	Conditional = { fg = p.base0C },
	Constant = { fg = p.base0A },
	Debug = { fg = p.base0B },
	Define = { fg = p.base0E },
	Delimiter = { fg = p.base0B },
	Error = { fg = p.base09 },
	Exception = { fg = p.base0C },
	Float = { fg = p.base0A },
	Function = { fg = p.base0B },
	Identifier = { fg = p.base0B },
	-- Ignore = { fg = '' },
	Include = { fg = p.base0E },
	Keyword = { fg = p.base0C },
	Label = { fg = p.base0D },
	Macro = { fg = p.base0E },
	Number = { fg = p.base0A },
	Operator = { fg = p.base04 },
	PreCondit = { fg = p.base0E },
	PreProc = { fg = p.base0E },
	Repeat = { fg = p.base0C },
	Special = { fg = p.base0B },
	SpecialChar = { fg = p.base0B },
	SpecialComment = { fg = p.base0E },
	Statement = { fg = p.base0C },
	StorageClass = { fg = p.base0D },
	String = { fg = p.base0A },
	Structure = { fg = p.base0D },
	Tag = { fg = p.base0B },
	Todo = { fg = p.base0E },
	Type = { fg = p.base0D },
	Typedef = { fg = p.base0D },
	Underlined = { fg = p.base0D, style = "underline" },

	htmlArg = { fg = p.base0E },
	htmlEndTag = { fg = p.base04 },
	htmlLink = { fg = p.base05 },
	htmlTag = { fg = p.base04 },
	htmlTagN = { fg = p.base09 },
	htmlTagName = { fg = p.base0D },

	-- for legacy support

	LspDiagnosticDefaultHint = { fg = p.base0E },
	LspDiagnosticDefaultInformation = { fg = p.base0D },
	LspDiagnosticDefaultWarning = { fg = p.base0A },
	LspDiagnosticDefaultError = { fg = p.base09 },

	LspDiagnosticFloatingHint = { fg = p.base0E },
	LspDiagnosticFloatingInformation = { fg = p.base0D },
	LspDiagnosticFloatingWarning = { fg = p.base0A },
	LspDiagnosticFloatingError = { fg = p.base09 },

	LspDiagnosticSignHint = { fg = p.base0E },
	LspDiagnosticSignInformation = { fg = p.base0D },
	LspDiagnosticSignWarning = { fg = p.base0A },
	LspDiagnosticSignError = { fg = p.base09 },

	-- new syntax
	DiagnosticDefaultHint = { fg = p.base0E },
	DiagnosticDefaultInfo = { fg = p.base0D },
	DiagnosticDefaultWarn = { fg = p.base0A },
	DiagnosticDefaultError = { fg = p.base09 },

	DiagnosticFloatingHint = { fg = p.base0E },
	DiagnosticFloatingInfo = { fg = p.base0D },
	DiagnosticFloatingWarn = { fg = p.base0A },
	DiagnosticFloatingError = { fg = p.base09 },

	DiagnosticSignHint = { fg = p.base0E },
	DiagnosticSignInfo = { fg = p.base0D },
	DiagnosticSignWarn = { fg = p.base0A },
	DiagnosticSignError = { fg = p.base09 },

	DiagnosticUnderlineHint = { style = "undercurl", sp = p.base0E },
	DiagnosticUnderlineInfo = { style = "undercurl", sp = p.base0D },
	DiagnosticUnderlineWarn = { style = "undercurl", sp = p.base0A },
	DiagnosticUnderlineError = { style = "undercurl", sp = p.base09 },

	DiagnosticVirtualTextHint = { fg = p.base0E },
	DiagnosticVirtualTextInfo = { fg = p.base0D },
	DiagnosticVirtualTextWarn = { fg = p.base0A },
	DiagnosticVirtualTextError = { fg = p.base09 },

	LspReferenceText = { fg = p.base0B, bg = p.base02 },
	LspReferenceRead = { fg = p.base0B, bg = p.base02 },
	LspReferenceWrite = { fg = p.base0B, bg = p.base02 },
}

function theme.load_terminal()
	-- black
	vim.g.terminal_color_0 = p.base02
	vim.g.terminal_color_8 = p.base04
	-- red
	vim.g.terminal_color_1 = p.base09
	vim.g.terminal_color_9 = p.base09
	-- green
	vim.g.terminal_color_2 = p.base0C
	vim.g.terminal_color_10 = p.base0C
	-- yellow
	vim.g.terminal_color_3 = p.base0A
	vim.g.terminal_color_11 = p.base0A
	-- blue
	vim.g.terminal_color_4 = p.base0D
	vim.g.terminal_color_12 = p.base0D
	-- magenta
	vim.g.terminal_color_5 = p.base0E
	vim.g.terminal_color_13 = p.base0E
	-- cyan
	vim.g.terminal_color_6 = p.base0B
	vim.g.terminal_color_14 = p.base0B
	-- white
	vim.g.terminal_color_7 = p.base05
	vim.g.terminal_color_15 = p.base05
end

theme.treesitter = {
	-- TSAnnotation = {},
	-- TSAttribute = {},
	TSBoolean = { fg = p.base0B },
	-- TSCharacter = {},
	TSComment = {
		fg = p.base03,
		style = maybe_italic,
	},
	-- TSConditional = {},
	TSConstBuiltin = { fg = p.base09 },
	-- TSConstMacro = {},
	TSConstant = { fg = p.base0D },
	TSConstructor = { fg = p.base0D },
	-- TSEmphasis = {},
	-- TSError = {},
	-- TSException = {},
	TSField = { fg = p.base0D },
	-- TSFloat = {},
	TSFuncBuiltin = { fg = p.base09 },
	-- TSFuncMacro = {},
	TSFunction = { fg = p.base0B },
	TSInclude = { fg = p.base0C },
	TSKeyword = { fg = p.base0C },
	-- TSKeywordFunction = {},
	TSKeywordOperator = { fg = p.base0C },
	TSLabel = { fg = p.base0D },
	-- TSLiteral = {},
	-- TSMethod = {},
	-- TSNamespace = {},
	-- TSNone = {},
	-- TSNumber = {},
	TSOperator = { fg = p.base0C },
	TSParameter = {
		fg = p.base0E,
		style = maybe_italic,
	},
	-- TSParameterReference = {},
	TSProperty = {
		fg = p.base0E,
		style = maybe_italic,
	},
	TSPunctBracket = { fg = p.base04 },
	TSPunctDelimiter = { fg = p.base04 },
	TSPunctSpecial = { fg = p.base04 },
	-- TSRepeat = {},
	-- TSStrike = {},
	TSString = { fg = p.base0A },
	TSStringEscape = { fg = p.base0C },
	-- TSStringRegex = {},
	-- TSSymbol = {},
	TSTag = { fg = p.base0D },
	TSTagDelimiter = { fg = p.base04 },
	TSText = { fg = p.base05 },
	-- TSTitle = {},
	-- TSType = {},
	-- TSTypeBuiltin = {},
	TSURI = { fg = p.base0A },
	-- TSUnderline = {},
	TSVariable = {
		fg = p.base05,
		style = maybe_italic,
	},
	TSVariableBuiltin = { fg = p.base09 },
}

theme.plugins = {
	-- barbar.nvim
	-- https://github.com/romgrk/barbar.nvim
	BufferTabpageFill = { bg = "NONE" },
	BufferCurrent = { fg = p.base05, bg = p.base02 },
	BufferCurrentIndex = { fg = p.base05, bg = p.base02 },
	BufferCurrentMod = { fg = p.base0D, bg = p.base02 },
	BufferCurrentSign = { fg = p.base04, bg = p.base02 },
	BufferInactive = { fg = p.base04 },
	BufferInactiveIndex = { fg = p.base04 },
	BufferInactiveMod = { fg = p.base0D },
	BufferInactiveSign = { fg = p.base04 },
	BufferVisible = { fg = p.base04 },
	BufferVisibleIndex = { fg = p.base04 },
	BufferVisibleMod = { fg = p.base0D },
	BufferVisibleSign = { fg = p.base04 },

	-- gitsigns.nvim
	-- https://github.com/lewis6991/gitsigns.nvim
	SignAdd = { fg = p.base0D },
	SignChange = { fg = p.base0B },
	SignDelete = { fg = p.base09 },
	GitSignsAdd = { fg = p.base0D },
	GitSignsChange = { fg = p.base0B },
	GitSignsDelete = { fg = p.base09 },

	-- modes.nvim
	-- https://github.com/mvllow/modes.nvim
	ModesCopy = { bg = p.base0A },
	ModesDelete = { bg = p.base09 },
	ModesInsert = { bg = p.base0D },
	ModesVisual = { bg = p.base0E },

	-- nvim-tree.lua
	-- https://github.com/kyazdani42/nvim-tree.lua
	NvimTreeNormal = { fg = p.base05 },

	NvimTreeFileDeleted = { fg = p.base09 },
	NvimTreeFileDirty = { fg = p.base0B },
	NvimTreeFileMerge = { fg = p.base0E },
	NvimTreeFileNew = { fg = p.base0D },
	NvimTreeFileRenamed = { fg = p.base0C },
	NvimTreeFileStaged = { fg = p.base0E },

	NvimTreeEmptyFolderName = { fg = p.base03 },
	NvimTreeFolderIcon = { fg = p.base04 },
	NvimTreeFolderName = { fg = p.base0D },
	NvimTreeOpenedFile = { fg = p.base05, bg = p.base01 },
	NvimTreeOpenedFolderName = { fg = p.base0D },
	NvimTreeRootFolder = { fg = p.base0E },
	NvimTreeSpecialFile = { link = "NvimTreeNormal" },

	NvimTreeGitDeleted = { fg = p.base09 },
	NvimTreeGitDirty = { fg = p.base0B },
	NvimTreeGitIgnored = { fg = p.base04 },
	NvimTreeGitMerge = { fg = p.base0E },
	NvimTreeGitNew = { fg = p.base0D },
	NvimTreeGitRenamed = { fg = p.base0C },
	NvimTreeGitStaged = { fg = p.base0E },

	NvimTreeWindowPicker = { fg = p.base00, bg = p.base0E },

	-- which-key.nvim
	-- https://github.com/folke/which-key.nvim
	WhichKey = { fg = p.base0E },
	WhichKeyGroup = { fg = p.base0D },
	WhichKeySeparator = { fg = p.base04 },
	WhichKeyDesc = { fg = p.base0A },
	WhichKeyFloat = { bg = p.base01 },
	WhichKeyValue = { fg = p.base0B },

	-- indent-blankline.nvim
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	IndentBlanklineChar = { fg = p.base04 },
}

return theme
