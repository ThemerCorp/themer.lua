local util = require("themer.utils.util")
local config = require("themer.config").options

---@class mapper
local mapper = {}

---return the basic hig groups
---@param cp table
---@return table
local function get_base(cp)
	local base = {
		Comment = vim.tbl_deep_extend("force", { fg = cp.comment }, config.styles.comments), -- any comment
		ColorColumn = { bg = util.darken(cp.cyan, 0.2) }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = cp.black }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = cp.bg, bg = cp.fg }, -- character under the cursor
		lCursor = { fg = cp.bg, bg = cp.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { fg = cp.bg, bg = cp.fg }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = cp.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is secp.
		CursorLine = { bg = cp.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is secp.  Low-priority if foreground (ctermfg OR guifg) is not secp.
		Directory = { fg = cp.blue }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = cp.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = cp.red_br }, -- error messages on the command line
		VertSplit = { fg = cp.black }, -- the column separating vertically split windows
		Folded = { fg = cp.blue, bg = cp.fg_gutter }, -- line used for closed folds
		FoldColumn = { bg = cp.bg, fg = cp.comment }, -- 'foldcolumn'
		SignColumn = { bg = config.transparency and cp.none or cp.bg, fg = cp.fg_gutter }, -- column where |signs| are displayed
		SignColumnSB = { bg = cp.bg_alt, fg = cp.fg_gutter }, -- column where |signs| are displayed
		Substitute = { bg = cp.red, fg = cp.black }, -- |:substitute| replacement text highlighting
		LineNr = { fg = cp.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
		CursorLineNr = { fg = cp.fg_alt }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
		MatchParen = { fg = cp.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = cp.fg_alt, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = cp.white_br }, -- Area for messages and cmdline
		MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = cp.blue }, -- |more-prompt|
		NonText = { fg = cp.comment }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = cp.fg, bg = config.transparency and cp.none or cp.bg }, -- normal text
		NormalNC = { fg = cp.fg, bg = config.transparency and cp.none or cp.bg }, -- normal text in non-current windows
		NormalSB = { fg = cp.fg_alt, bg = cp.bg_alt }, -- normal text in non-current windows
		NormalFloat = { fg = cp.fg, bg = cp.bg_alt }, -- Normal text in floating windows.
		FloatBorder = { fg = cp.black_highlight },
		Pmenu = { bg = cp.bg_alt, fg = cp.fg }, -- Popup menu: normal item.
		PmenuSel = { fg = cp.cyan, bg = util.darken(cp.fg_gutter, 0.8) }, -- Popup menu: selected item.
		PmenuSbar = { bg = util.lighten(cp.bg_alt, 0.95) }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = cp.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = cp.blue }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = util.darken(cp.cyan, 0.2), bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = util.darken(cp.cyan, 0.3), fg = cp.fg }, -- Last search patern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
		IncSearch = { bg = cp.cyan, fg = cp.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		SpecialKey = { fg = cp.fg }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = cp.red_br, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = cp.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = cp.blue, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = cp.white_br, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = cp.fg_alt, bg = cp.bg_alt }, -- status line of current window
		StatusLineNC = { fg = cp.fg_gutter, bg = cp.bg_alt }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = cp.bg_alt, fg = cp.fg_gutter }, -- tab pages line, not active tab page label
		TabLineFill = { bg = cp.black }, -- tab pages line, where there are no labels
		TabLineSel = { fg = cp.fg_alt, bg = cp.fg_gutter }, -- tab pages line, active tab page label
		Title = { fg = cp.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etcp.
		Visual = { bg = util.darken(cp.cyan, 0.2) }, -- Visual mode selection
		VisualNOS = { bg = util.darken(cp.cyan, 0.2) }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = cp.yellow }, -- warning messages
		Whitespace = { fg = cp.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = util.darken(cp.cyan, 0.2) }, -- current match in 'wildmenu' completion
		Constant = { fg = cp.orange }, -- (preferred) any constant
		String = vim.tbl_deep_extend("force", { fg = cp.green }, config.styles.strings), -- a string constant: "this is a string"
		Character = { fg = cp.green }, --  a character constant: 'c', '\n'
		Number = { fg = cp.orange_br }, --   a number constant: 234, 0xff
		Float = { fg = cp.orange_br }, --    a floating point constant: 2.3e10
		Boolean = { fg = cp.orange_br }, --  a boolean constant: TRUE, false
		Identifier = vim.tbl_deep_extend("force", { fg = cp.cyan }, config.styles.variables), -- (preferred) any variable name
		Function = vim.tbl_deep_extend("force", { fg = cp.blue }, config.styles.functions), -- function name (also: methods for classes)
		Statement = { fg = cp.magenta_br }, -- (preferred) any statement
		Conditional = { fg = cp.red }, --  if, then, else, endif, switch, etcp.
		Repeat = { fg = cp.red }, --   for, do, while, etcp.
		Label = { fg = cp.magenta_br }, --    case, default, etcp.
		Operator = { fg = cp.fg_alt }, -- "sizeof", "+", "*", etcp.
		Keyword = vim.tbl_deep_extend("force", { fg = cp.magenta }, config.styles.keywords), --  any other keyword
		-- Exception     = { }, --  try, catch, throw

		PreProc = { fg = cp.pink }, -- (preferred) generic Preprocessor
		Include = { fg = cp.pink }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etcp.

		Type = { fg = cp.yellow }, -- (preferred) int, long, char, etcp.
		StorageClass = { fg = cp.yellow }, -- static, register, volatile, etcp.
		Structure = { fg = cp.yellow }, --  struct, union, enum, etcp.
		Typedef = { fg = cp.yellow }, --  A typedef
		Special = { fg = cp.blue }, -- (preferred) any special symbol
		-- SpecialChar   = { }, --  special character in a constant
		-- Tag           = { }, --    you can use CTRL-] on this
		-- Delimiter     = { }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment
		-- Debug         = { }, --    debugging statements

		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Italic = { italic = true },
		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = cp.red_br }, -- (preferred) any erroneous construct
		Todo = { bg = cp.yellow, fg = cp.bg, bold = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		qfLineNr = { fg = cp.yellow },
		qfFileName = { fg = cp.blue },
		htmlH1 = { fg = cp.magenta, bold = true },
		htmlH2 = { fg = cp.blue, bold = true },
		-- mkdHeading = { fg = cp.orange, bold = true },
		-- mkdCode = { bg = cp.terminal_black, fg = cp.fg },
		mkdCodeDelimiter = { bg = cp.terminal_black, fg = cp.fg },
		mkdCodeStart = { fg = cp.cyan, bold = true },
		mkdCodeEnd = { fg = cp.cyan, bold = true },
		mkdLink = { fg = cp.blue, underline = true },

		-- debugging
		debugPC = { bg = cp.bg_alt }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = util.darken(cp.blue, 0.1), fg = cp.blue }, -- used for breakpoint colors in terminal-debug
		-- illuminate
		illuminatedWord = { bg = cp.fg_gutter },
		illuminatedCurWord = { bg = cp.fg_gutter },
		-- diff
		diffAdded = { fg = cp.blue },
		diffRemoved = { fg = cp.red },
		diffChanged = { fg = cp.yellow },
		diffOldFile = { fg = cp.yellow },
		diffNewFile = { fg = cp.orange },
		diffFile = { fg = cp.blue },
		diffLine = { fg = cp.comment },
		diffIndexLine = { fg = cp.magenta },
		DiffAdd = { fg = cp.blue, bg = cp.bg }, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = cp.yellow, bg = cp.bg }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { fg = cp.red, bg = cp.bg }, -- diff mode: Deleted line |diff.txt|
		DiffText = { fg = cp.blue, bg = cp.bg }, -- diff mode: Changed text within a changed line |diff.txt|
		-- NeoVim
		healthError = { fg = cp.red_br },
		healthSuccess = { fg = cp.green_br },
		healthWarning = { fg = cp.yellow },
	}

        return base
end

---return the final integrations table
---@param cp table
---@return table
local function get_integrations(cp)
	local integrations = config["integrations"]
	local final_integrations = {}

	for integration in pairs(integrations) do
		local cot = false
		if type(integrations[integration]) == "table" then
			if integrations[integration]["enabled"] == true then
				cot = true
			end
		else
			if integrations[integration] == true then
				cot = true
			end
		end

		if cot then
			final_integrations = vim.tbl_deep_extend("force", final_integrations, require(table.concat({"themer.core.integrations.", integration})).get(cp))
		end
	end

	final_integrations = vim.tbl_deep_extend("force", final_integrations, require("themer.core.remaps").get_hig_remaps() or {})
	return final_integrations
end

---get color scheme properties
---@param cp table
---@return table
local function get_properties(cp)
	local props = {
		termguicolors = true,
		background = cp.type or "dark",
	}
	return props
end

---return theme table containing highlights
---@param color_scheme table
---@return table
function mapper.apply(color_scheme)
	-- moved to ../main.lua
	-- local err, color_scheme = require("themer.api.colors").get_color_scheme(cs or config.colorscheme)

	-- if not err.status then
	-- 	vim.api.nvim_err_writeln(err.msg)
	-- end

	local theme = {}
	theme.colors = color_scheme
	theme.base = get_base(color_scheme)
	theme.integrations = get_integrations(color_scheme)
	theme.properties = get_properties(color_scheme)

	return theme
end

return mapper
