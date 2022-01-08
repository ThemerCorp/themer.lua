local config = require("themer.config")("get")

---return a cleaned styles
---@param cp table
---@return table
local function remap_styles(cp)
    local groups = {
        styles = {
            comment = { fg = cp.subtle },
            func = { fg = cp.blue },
            keyword = { fg = cp.magenta },
            string = { fg = cp.green },
            variable = { fg = cp.fg },
            parameter = { fg = cp.yellow },
            field = { fg = cp.fg },
            punc = { fg = cp.subtle },
            heading = {
                h1 = { style = "bold", fg = cp.magenta },
                h2 = { style = "bold", fg = cp.green },
                h3 = { style = "bold", fg = cp.orange },
                h4 = { style = "bold", fg = cp.yellow },
                h5 = { style = "bold", fg = cp.green },
                h6 = { style = "bold", fg = cp.blue },
            },
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

    groups = vim.tbl_deep_extend("force", groups, cp.groups or {}, config or {})
    return groups
end

---return the basic hig groups
---@param cp table
---@return table
local function get_base(cp)
    local groups = remap_styles(cp)
    cp.built_in = cp.built_in or cp.syntax

    -- Transparent
    cp.bg.base = config.transparency and "NONE" or cp.bg.base
    cp.bg.alt = config.transparency and "NONE" or cp.bg.base

    -- ---------------------
    -- ░█▀▄░█▀█░█▀▀░█▀▀
    -- ░█▀▄░█▀█░▀▀█░█▀▀
    -- ░▀▀░░▀░▀░▀▀▀░▀▀▀
    -- ---------------------
    local base = {
        -- base groups
        ThemerAccent = { fg = cp.accent },
        ThemerAccentFloat = { fg = cp.accent, bg = cp.bg.alt },
        ThemerFloat = { bg = cp.bg.alt },
        ThemerMatch = { fg = cp.match, bold = true },
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
        ThemerFunction = { fg = cp.syntax["function"] },
        ThemerFunctionBuiltIn = { fg = cp.built_in["function"] },
        ThemerVariable = { fg = cp.syntax.variable },
        ThemerVariableBuiltIn = { fg = cp.built_in.variable },
        ThemerInclude = { fg = cp.syntax.include },
        ThemerKeyword = { fg = cp.syntax.keyword },
        ThemerKeywordBuiltIn = { fg = cp.built_in.keyword },
        ThemerStruct = { fg = cp.syntax.struct },
        ThemerString = { fg = cp.syntax.string },
        ThemerParameter = { fg = cp.syntax.parameter },
        ThemerField = { fg = cp.syntax.field },
        ThemerType = { fg = cp.syntax.type },
        ThemerTypeBuiltIn = { fg = cp.built_in.type },
        ThemerProperty = { fg = cp.syntax.property or cp.syntax.variable },
        ThemerPunctuation = { fg = cp.syntax.punctuation },
        ThemerConstructor = { fg = cp.syntax.constructor or cp.syntax.punctuation },
        ThemerOperator = { fg = cp.syntax.operator or cp.sytax.punctuation },
        ThemerPuncDelimiter = { fg = cp.syntax.punc_delimiter or cp.syntax.punctuation },
        ThemerConstant = { fg = cp.syntax.constant },
        ThemerConstantBuiltIn = { fg = cp.built_in.constant },
        ThemerTodo = { fg = cp.syntax.todo },
        ThemerCharacter = { fg = cp.syntax.character },
        ThemerConditional = { fg = cp.syntax.conditional },
        ThemerPreProc = { fg = cp.syntax.preproc },
        ThemerNumber = { fg = cp.syntax.number },
        ThemerStatement = { fg = cp.syntax.statement },

        -- helpful groups
        ThemerSubtle = { fg = cp.dimmed.subtle },
        ThemerSubtleFloat = { fg = cp.dimmed.subtle, bg = cp.bg.alt },
        ThemerDimmed = { fg = cp.dimmed.inactive },
        ThemerDimmedFloat = { fg = cp.dimmed.inactive, bg = cp.bg.alt },
        ThemerBorder = { fg = cp.border, bg = cp.bg.alt },
        ThemerURI = { fg = cp.uri, underline = true },

        -- headings
        ThemerHeadingH1 = { bold = true, fg = cp.heading.h1 },
        ThemerHeadingH2 = { bold = true, fg = cp.heading.h2 },
        ThemerHeadingH3 = { bold = true, fg = cp.heading.h3 },
        ThemerHeadingH4 = { bold = true, fg = cp.heading.h4 },
        ThemerHeadingH5 = { bold = true, fg = cp.heading.h5 },
        ThemerHeadingH6 = { bold = true, fg = cp.heading.h6 },

        ColorColumn = { link = "ThemerFloat" },
        Conceal = { bg = cp.conceal or "NONE" },
        Cursor = { reverse = true },
        CursorColumn = { link = "ThemerFloat" },
        CursorIM = { reverse = true },
        CursorLine = { link = "ThemerSelected" },
        CursorLineNr = { link = "ThemerText" },
        DarkenedPanel = { link = "ThemerFloat" },
        DarkenedStatusline = { link = "ThemerFloat" },
        Directory = { link = "ThemerAccent" },
        EndOfBuffer = { link = "ThemerText" },
        ErrorMsg = { fg = cp.diagnostics.error, bold = true },
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
            CmpItemAbbrDeprecated = { fg = cp.fg, bg = "NONE", strikethrough = true },
            CmpItemAbbrMatch = { link = "ThemerMatch" },
            CmpItemAbbrMatchFuzzy = { link = "ThemerMatch" },

            CmpItemKindDefault = { link = "ThemerSubtleFloat" },
            CmpItemMenu = { link = "ThemerDimmedFloat" },

            CmpItemKindKeyword = { link = "ThemerKeyword" },

            CmpItemKindVariable = { link = "ThemerVariable" },
            CmpItemKindConstant = { link = "ThemerConstant" },
            CmpItemKindReference = { link = "ThemerInclude" },
            -- CmpItemKindValue = { link = "Themer" },

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
            IndentBlanklineChar = { fg = cp.dimmed.subtle, nocombine = true },
            IndentBlanklineContextChar = { fg = cp.accent, nocombine = true },
            IndentBlanklineSpaceChar = { link = "IndentBlanklineChar" },
            IndentBlanklineSpaceCharBlankline = { link = "IndentBlanklineChar" },
            IndentBlanklineContextStart = { underline = true, sp = cp.accent },
        },

        lsp = {
            LspReferenceText = { link = "ThemerFloat" },
            LspReferenceRead = { link = "ThemerFloat" },
            LspReferenceWrite = { link = "ThemerFloat" },
            DiagnosticError = { fg = groups.diagnostics.colors.error },
            DiagnosticWarn = { fg = groups.diagnostics.colors.warn },
            DiagnosticInfo = { fg = groups.diagnostics.colors.info },
            DiagnosticHint = { fg = groups.diagnostics.colors.hint },
            DiagnosticSignError = { link = "DiagnosticHint" },
            DiagnosticSignWarn = { link = "DiagnosticWarn" },
            DiagnosticSignInfo = { link = "DiagnosticInfo" },
            DiagnosticSignHint = { link = "DiagnosticHint" },

            DiagnosticDefaultError = { link = "DiagnosticHint" },
            DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
            DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
            DiagnosticDefaultHint = { link = "DiagnosticHint" },
            DiagnosticFloatingError = { bg = cp.bg.alt, fg = groups.diagnostics.colors.error },
            DiagnosticFloatingWarn = { bg = cp.bg.alt, fg = groups.diagnostics.colors.warn },
            DiagnosticFloatingInfo = { bg = cp.bg.alt, fg = groups.diagnostics.colors.info },
            DiagnosticFloatingHint = { bg = cp.bg.alt, fg = groups.diagnostics.colors.hint },
            DiagnosticVirtualTextError = groups.diagnostics.virtual_text.error,
            DiagnosticVirtualTextWarn = groups.diagnostics.virtual_text.warn,
            DiagnosticVirtualTextInfo = groups.diagnostics.virtual_text.info,
            DiagnosticVirtualTextHint = groups.diagnostics.virtual_text.hint,
            DiagnosticUnderlineError = groups.diagnostics.underlines.error,
            DiagnosticUnderlineWarn = groups.diagnostics.underlines.warn,
            DiagnosticUnderlineInfo = groups.diagnostics.underlines.info,
            DiagnosticUnderlineHint = groups.diagnostics.underlines.hint,

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
            TSComment = groups.styles.comment,
            TSNote = { bg = cp.blue, fg = groups.diagnostics.colors.info },
            TSWarning = { bg = cp.bg, fg = groups.diagnostics.colors.warn },
            TSDanger = { bg = cp.bg, fg = groups.diagnostics.colors.error },
            TSConditional = { fg = cp.red },
            TSConstBuiltin = { fg = cp.red },
            -- TSConstMacro = {},
            TSConstant = { fg = cp.orange },
            TSConstructor = { fg = cp.magenta },
            -- TSEmphasis = {},
            -- TSError = {},
            -- TSException = {},
            TSField = groups.styles.field,
            -- TSFloat = {},
            TSFuncBuiltin = { fg = cp.blue },
            -- TSFuncMacro = {},
            TSFunction = groups.styles.func,
            TSInclude = { fg = cp.green },
            TSKeyword = groups.styles.keyword,
            TSKeywordFunction = { fg = cp.magenta },
            TSKeywordOperator = { fg = cp.blue },
            TSLabel = { fg = cp.green },
            -- TSLiteral = {},
            -- TSMethod = {},
            -- TSNamespace = {},
            -- TSNone = {},
            -- TSNumber = {},
            TSOperator = { fg = cp.blue },
            TSParameter = groups.styles.parameter,
            -- TSParameterReference = {},
            TSProperty = groups.styles.field,
            TSPunctBracket = groups.styles.punc,
            TSPunctDelimiter = groups.styles.punc,
            TSPunctSpecial = groups.styles.punc,
            -- TSRepeat = {},
            -- TSStrike = {},
            TSString = groups.styles.string,
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
            TSVariable = groups.styles.variable,
            TSVariableBuiltin = groups.variable,
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
            htmlBold = { fg = cp.fg, bold = true },
            htmlBoldUnderline = { fg = cp.fg, bold = true, underline = true },
            htmlBoldItalic = { fg = cp.fg, bold = true, italic = true },
            htmlBoldUnderlineItalic = { fg = cp.fg, italic = true, bold = true, underline = true },
            htmlUnderline = { fg = cp.fg, underline = true },
            htmlUnderlineItalic = { fg = cp.fg, underline = true, italic = true },
            htmlItalic = { fg = cp.fg, italic = true },
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
            markdownItalic = { fg = cp.fg, italic = true },
            markdownBold = { fg = cp.fg, bold = true },
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
        base = base,
        plugins = plugins,
        langs = langs,
    }
end

--- return the final integrations table
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
return function(cp, cs)
    local theme = {}
    theme.colors = cp
    theme.hig_groups = get_hig_groups(cp, cs)
    theme.properties = get_properties(cp)
    return theme
end
