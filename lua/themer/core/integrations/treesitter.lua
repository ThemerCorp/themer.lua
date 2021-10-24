local util = require("themer.utils.util")
local hi = {}
local config = require("themer.config").options

function hi.get(cp)
	return {
		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		-- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSAttribute         = { };
		-- TSBoolean           = { };    -- For booleans.
		-- TSCharacter         = { };    -- For characters.
		TSComment = vim.tbl_deep_extend("force", { fg = cp.comment }, config.styles.comments), -- For comment blocks.
		TSNote = { fg = cp.bg, bg = cp.blue },
		TSWarning = { fg = cp.bg, bg = cp.yellow },
		TSDanger = { fg = cp.bg, bg = cp.red },
		TSConstructor = { fg = cp.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		-- TSConditional       = { };    -- For keywords related to conditionnals.
		TSConstant = { fg = cp.orange }, -- For constants
		TSConstBuiltin = { fg = cp.orange_br }, -- For constant that are built in the language: `nil` in Lua.
		-- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in cp.
		-- TSError             = { };    -- For syntax/parser errors.
		-- TSException         = { };    -- For exception related keywords.
		TSField = { fg = cp.red }, -- For fields.
		rustTSField = { fg = util.darken(cp.white, 0.75) }, -- For fields.
		-- TSFloat             = { };    -- For floats.
		TSFunction = vim.tbl_deep_extend("force", { fg = cp.blue }, config.styles.functions), -- For function (calls and definitions).
		TSFuncBuiltin = { fg = cp.cyan }, -- For builtin functions: `table.insert` in Lua.
		TSFuncMacro = { fg = cp.red }, -- For macro defined functions (calls and definitions): each `macro_rules` in Ruscp.
		TSInclude = vim.tbl_deep_extend("force", { fg = cp.magenta }, config.styles.keywords), -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword = vim.tbl_deep_extend("force", { fg = cp.magenta }, config.styles.keywords), -- For keywords that don't fall in previous categories.
		TSKeywordFunction = vim.tbl_deep_extend("force", { fg = cp.magenta_br }, config.styles.keywords), -- For keywords used to define a fuction.
		TSLabel = { fg = cp.blue }, -- For labels: `label:` in C and `:label:` in Lua.
		-- TSMethod            = { };    -- For method calls and definitions.
		TSNamespace = { fg = cp.cyan }, -- For identifiers referring to modules and namespaces.
		TSNone              = { fg = cp.red };
		-- TSNumber            = { };    -- For all numbers
		TSOperator = { fg = cp.cyan }, -- For any operator: `+`, but also `->` and `*` in cp.
		TSParameter = { fg = cp.orange_br }, -- For parameters of a function.
		-- TSParameterReference= { };    -- For references to parameters of a function.
		TSProperty = { fg = cp.red_br }, -- Same as `TSField`.
		tomlTSProperty = { fg = cp.blue }, -- Differentiates between string and properties
		TSPunctDelimiter = { fg = cp.green_br }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = cp.red }, -- For brackets and parenthesis.
		TSPunctSpecial = { fg = cp.white }, -- For special punctutation that does not fall in the catagories before.
		-- TSRepeat            = { };    -- For keywords related to loops.
		TSString            = { fg = cp.green };    -- For strings.
		TSStringRegex = vim.tbl_deep_extend("force", { fg = cp.blue }, config.styles.strings), -- For regexes.
		TSStringEscape = vim.tbl_deep_extend("force", { fg = cp.magenta }, config.styles.strings), -- For escape characters within a string.
		-- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
		-- TSType              = { };    -- For types.
		TSTypeBuiltin = { fg = cp.cyan }, -- For builtin types.
		TSVariable = config.styles.variables, -- Any variable name that does not have another highlight.
		TSVariableBuiltin = { fg = cp.red }, -- Variable names that ar defined by the languages, like `this` or `self`.
		-- TSTag               = { };    -- Tags like html tag names.
		-- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
		-- TSText              = { };    -- For strings considered text in a markup language.
		TSTextReference = { fg = cp.cyan },
		TSEmphasis          = { bold = true, underline = true };    -- For text to be represented with emphasis.
		TSUnderline         = { underline = true };    -- For text to be represented with an underline.
		-- TSStrike            = { };    -- For strikethrough text.
		TSTitle             = { bold = true, fg = cp.white_br };    -- Text that is part of a title.
		TSLiteral           = { fg = cp.green_br };    -- Literal text.
		TSURI               = { fg = cp.blue_br, underline = true };    -- Any URI like a link or email.
	}
end

return hi
