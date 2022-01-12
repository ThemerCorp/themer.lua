local config = require("themer.config")("get")

---Add link = "NONE" to get rid of default links
---@return table remaps
---@param rmp table
local clean_remaps = function(rmp)
    for groupName, _ in pairs(rmp) do
        if groupName == "base" then
            for bgrName, _ in pairs(rmp.base) do
                rmp[groupName][bgrName].link = rmp[groupName][bgrName].link or "NONE"
            end
        else
            for plName, _ in pairs(rmp[groupName]) do
                if type(rmp[groupName][plName]) == "table" then
                    for inPlName, _ in pairs(rmp[groupName][plName]) do
                        rmp[groupName][plName][inPlName].link = rmp[groupName][plName][inPlName].link or "NONE"
                    end
                end
            end
        end
    end
    return rmp
end

---@return table a cleaned styles
---@param cp table
---@return table
local function remap_styles(cp)
    local groups = {
        heading = {
            h1 = { style = "bold", fg = cp.heading.h1 or cp.fg },
            h2 = { style = "bold", fg = cp.heading.h2 or cp.fg },
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
        comment = { fg = cp.syntax.comment or cp.dimmed.subtle },
        punctuation = { fg = cp.syntax.punctuation },
        constructor = { fg = cp.syntax.constructor or cp.syntax.punctuation },
        operator = { fg = cp.syntax.operator or cp.sytax.punctuation },
        constant = { fg = cp.syntax.constant },
        constantBuiltIn = { fg = cp.built_in.constant },
        todo = cp.syntax.todo,
        character = { fg = cp.syntax.character },
        conditional = { fg = cp.syntax.conditional },
        number = { fg = cp.syntax.number },
        statement = { fg = cp.syntax.statement or cp.accent },
        uri = { fg = cp.uri, style = "underline" },
        diagnostic = {
            underline = {

                error = { fg = cp.diagnostic.error, style = "undercurl" },
                warn = { fg = cp.diagnostic.warn, style = "undercurl" },
                info = { fg = cp.diagnostic.info, style = "undercurl" },
                hint = { fg = cp.diagnostic.hint, style = "undercurl" },
            },
            virtual_text = {
                error = { fg = cp.diagnostic.error, style = "italic" },
                warn = { fg = cp.diagnostic.warn, style = "italic" },
                info = { fg = cp.diagnostic.info, style = "italic" },
                hint = { fg = cp.diagnostic.hint, style = "italic" },
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
    -- Transparent
    cp.bg.base = config.transparent and "NONE" or cp.bg.base
    cp.bg.alt = config.transparent and "NONE" or cp.bg.alt

    local groups = remap_styles(cp)

    local themer = {
        -- base groups
        ThemerAccent = { fg = cp.accent },
        ThemerAccentFloat = { fg = cp.accent, bg = cp.bg.alt },
        ThemerFloat = { bg = cp.bg.alt },
        ThemerMatch = { fg = cp.match, style = "bold" },
        ThemerNormal = { fg = cp.fg, bg = cp.bg.base },
        ThemerNormalFloat = { fg = cp.fg, bg = cp.bg.alt },
        ThemerSelected = { bg = cp.bg.selected },
        -- search terms
        ThemerSearchResult = { bg = cp.search_result.bg, fg = cp.search_result.fg, bold = true }, -- see :h hlsearch and do :set hlserch to see it in action

        -- git diffs
        DiffAdd = { bg = cp.diff.add },
        DiffChange = { bg = cp.diff.change },
        DiffText = { bg = cp.diff.text or cp.fg },
        DiffDelete = { bg = cp.diff.delete },
        GitSignsAdd = { fg = cp.diff.add },
        GitSignsDelete = { fg = cp.diff.delete },
        GitSignsChange = { fg = cp.diff.change },

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
        ThemerComment = groups.comment,
        ThemerParameter = groups.parameter,
        ThemerField = groups.field,
        ThemerType = groups.type,
        ThemerTypeBuiltIn = groups.typeBuiltIn,
        ThemerProperty = groups.property,
        ThemerPunctuation = groups.punctuation,
        ThemerConstructor = groups.constructor,
        ThemerOperator = groups.operator,
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
        ThemerBorder = { fg = cp.border },
        ThemerURI = groups.uri,

        -- headings
        ThemerHeadingH1 = groups.heading.h1,
        ThemerHeadingH2 = groups.heading.h2,
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
        CursorLineNr = { fg = cp.cursorlinenr or cp.fg },
        DarkenedPanel = { link = "ThemerFloat" },
        DarkenedStatusline = { link = "ThemerFloat" },
        Directory = { link = "ThemerAccent" },
        EndOfBuffer = { fg = cp.fg },
        ErrorMsg = { fg = cp.diagnostic.error, style = "bold" },
        Todo = { link = "ThemerTodo" },
        FloatBorder = { link = "ThemerSubtle" },
        Folded = { link = "ThemerNormalFloat" },
        IncSearch = { link = "ThemerSearchResult" },
        LineNr = { link = "ThemerDimmed" },
        MatchParen = { link = "ThemerNormalFloat" },
        -- ModeMsg = {},
        MoreMsg = { link = "ThemerAccent" },
        NonText = { link = "ThemerDimmed" },
        Normal = { fg = cp.fg, bg = cp.bg.base },
        NormalNC = { link = "Normal" },
        NormalFloat = { fg = cp.fg, bg = cp.bg.alt },
        Pmenu = { fg = cp.pum.fg or cp.dimmed.subtle, bg = cp.pum.bg or cp.bg.alt },
        PmenuSbar = { bg = cp.pum.sbar or cp.bg.selected },
        PmenuSel = { bg = cp.pum.sel.bg, fg = cp.pum.sel.fg },
        PmenuThumb = { bg = cp.pum.thumb or cp.dimmed.subtle },
        Question = { link = "ThemerAccent" },
        -- QuickFixLine = {},
        Search = { link = "ThemerSearchResult" },
        SpecialKey = { link = "ThemerAccent" },
        -- SpellBad = { style = "undercurl", sp = cp.red },
        -- SpellCap = { style = "undercurl", sp = cp.subtle },
        -- SpellLocal = { style = "undercurl", sp = cp.subtle },
        -- SpellRare = { style = "undercurl", sp = cp.subtle },
        SignColumn = { link = "ThemerNormal" },
        StatusLine = { link = "ThemerNormalFloat" },
        StatusLineNC = { link = "ThemerSubtleFloat" },
        -- StatusLineTerm = {},
        -- StatusLineTermNC = {},
        TabLine = { link = "ThemerNormalFloat" },
        TabLineFill = { link = "ThemerFloat" },
        TabLineSel = { link = "ThemerSearchResult" },
        Title = { fg = cp.title or cp.fg },
        VertSplit = { fg = cp.bg.alt, bg = cp.bg.alt },
        Visual = { link = "ThemerSelected" },
        -- VisualNOS = {},
        WarningMsg = { fg = cp.diagnostic.warn },
        -- Boolean = { link = "ThemerConstant" },
        Character = { link = "ThemerCharacter" },
        Comment = { link = "ThemerComment" },
        Conditional = { link = "ThemerConditional" },
        Constant = { link = "ThemerConstant" },
        -- Debug = { fg = cp.debug },
        -- Define = { fg = cp.magenta },
        Delimiter = { link = "ThemerPunctuation" },
        Error = { fg = cp.diagnostic.error },
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
        Type = { link = "ThemerType" },
        Typedef = { link = "ThemerType" },
        Underlined = { fg = cp.accent, style = "underline" },

        -- Neovim
        healthError = { link = "DiagnosticError" },
        healthWarning = { link = "DiagnosticWarn" },
        healthSuccess = { link = "DiagnosticInfo" },
    }

    ---------------------------------------
    -- ░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀
    -- ░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█
    -- ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
    ---------------------------------------

    local plugins = {}

    local availablePlugins = {
        cmp = {
            CmpDocumentation = { fg = cp.fg },
            CmpDocumentationBorder = { link = "ThemerBorder" },

            CmpItemAbbr = { fg = cp.fg },
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
            DiagnosticError = { fg = cp.diagnostic.error },
            DiagnosticWarn = { fg = cp.diagnostic.warn },
            DiagnosticInfo = { fg = cp.diagnostic.info },
            DiagnosticHint = { fg = cp.diagnostic.hint },
            DiagnosticSignError = { link = "DiagnosticHint" },
            DiagnosticSignWarn = { link = "DiagnosticWarn" },
            DiagnosticSignInfo = { link = "DiagnosticInfo" },
            DiagnosticSignHint = { link = "DiagnosticHint" },

            DiagnosticDefaultError = { link = "DiagnosticHint" },
            DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
            DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
            DiagnosticDefaultHint = { link = "DiagnosticHint" },
            DiagnosticUnderlineError = groups.diagnostic.underline.error,
            DiagnosticUnderlineWarn = groups.diagnostic.underline.warn,
            DiagnosticUnderlineInfo = groups.diagnostic.underline.info,
            DiagnosticUnderlineHint = groups.diagnostic.underline.hint,
            DiagnosticVirtualTextError = groups.diagnostic.virtual_text.error,
            DiagnosticVirtualTextWarn = groups.diagnostic.virtual_text.warn,
            DiagnosticVirtualTextInfo = groups.diagnostic.virtual_text.info,
            DiagnosticVirtualTextHint = groups.diagnostic.virtual_text.hint,

            LspSignatureActiveParameter = { link = "DiagnosticWarn" },
            LspCodeLens = { link = "ThemerSubtle" },
        },

        telescope = {
            TelescopeBorder = { link = "ThemerBorder" },
            TelescopeMatching = { fg = cp.search_result.telescope or cp.search_result.fg or cp.fg },
            TelescopeSelection = { link = "ThemerSelected" },
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
            markdownItalic = { fg = cp.fg, style = "italic" },
            markdownBold = { fg = cp.fg, style = "bold" },
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
        clean_remaps(config.remaps.highlights.globals or {}),
        clean_remaps(cp.remaps or {}),
        clean_remaps(config.remaps.highlights[cs] or {})
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
