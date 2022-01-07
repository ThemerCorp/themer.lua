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
        ThemerSelected = { bg = cp.bg.selected },
        ThemerCursor = { bg = cp.fg, fg = cp.bg.base },
        ThemerText = { fg = cp.fg, bg = cp.bg.base },
        ThemerTextFloat = { fg = cp.fg, bg = cp.bg.alt },

        -- search terms
        ThemerSearchResult = cp.search_result,
        ThemerMatchingSearchResult = cp.search_result, -- see :h hlsearch and do :set hlserch to see it in action

        -- git diffs
        DiffAdd = { bg = cp.diff.add },
        SignAdd = { fg = cp.diff.add },
        DiffChange = { bg = cp.diff.change },
        SignChange = { fg = cp.diff.change },
        DiffText = { bg = cp.diff.text or cp.fg },
        DiffDelete = { bg = cp.diff.delete },
        SignDelete = { fg = cp.diff.delete },

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

        -- gui stuff
        ThemerButton = { fg = cp.gui.button.base or cp.fg, bg = cp.gui.bg.base or cp.bg.alt },
        ThemerInactiveButton = {
            fg = cp.gui.button.inactive or cp.dimmed.subtle,
            bg = cp.gui.bg.inactive or cp.bg.alt,
        },
        ThemerInactiveSelectedButton = {
            fg = cp.gui.button.inactive_selected or cp.dimmed.subtle,
            bg = cp.gui.bg.selected or cp.bg.selected,
        },
        ThemerSuccessButton = { fg = cp.gui.button.success, bg = cp.gui.bg.base or cp.bg.alt },
        ThemerClosedSelectedButton = {
            fg = cp.gui.button.closed or cp.diff.delete,
            bg = cp.gui.bg.selected or cp.bg.selected,
        },
        ThemerSelection = { fg = cp.gui.fg_selected or cp.fg, bg = cp.gui.bg.selected or cp.bg.selected },

        ColorColumn = { link = "ThemerFloat" },
        Conceal = { bg = cp.conceal or "NONE" },
        Cursor = { link = "ThemerCursor" },
        CursorColumn = { link = "ThemerFloat" },
        CursorIM = { link = "ThemerCursor" },
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
        -- I have disabled this as it seems to link to Normal groups 
        -- and here we are doing same, lets see
        -- barbar = {
        --     -- BufferTabpageFill = { bg = "NONE" },
        --     BufferCurrent = { link = "ThemerTextFloat" },
        --     BufferCurrentIndex = { link = "ThemerTextFloat" },
        --     BufferCurrentMod = { link = "ThemerCurrentMod" },
        --     BufferCurrentSign = { link = "ThemerSubtleFloat" },
        --     BufferInactive = { link = "ThemerSubtleFloat" },
        --     BufferInactiveIndex = { link = "ThemerSubtleFloat" },
        --     BufferInactiveMod = { link = "ThemerSubtleMod" },
        --     BufferInactiveSign = { link = "ThemerSubtleFloat" },
        --     BufferVisible = { link = "ThemerSubtleFloat" },
        --     BufferVisibleIndex = { link = "ThemerSubtleFloat" },
        --     BufferVisibleMod = { link = "ThemerSubtleMod" },
        --     BufferVisibleSign = { link = "ThemerSubtleFloat"  },
        -- },

        bufferline = {
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
        },

        cmp = {
            CmpItemKind = { fg = cp.magenta },
            CmpItemAbbr = { fg = cp.subtle },
            CmpItemAbbrMatch = { fg = cp.fg, style = "bold" },
            CmpItemAbbrMatchFuzzy = { fg = cp.fg, style = "bold" },
            CmpItemAbbrDeprecated = { fg = cp.subtle, style = "strikethrough" },
        },

        gitsigns = {
            GitSignsAdd = { fg = cp.green },
            GitSignsChange = { fg = cp.orange },
            GitSignsDelete = { fg = cp.red },
        },

        indentline = {
            IndentBlanklineChar = { fg = cp.subtle, style = "nocombine" },
            IndentBlanklineIndent6 = { style = "nocombine", fg = cp.yellow },
            IndentBlanklineIndent5 = { style = "nocombine", fg = cp.red },
            IndentBlanklineIndent4 = { style = "nocombine", fg = cp.green },
            IndentBlanklineIndent3 = { style = "nocombine", fg = cp.orange },
            IndentBlanklineIndent2 = { style = "nocombine", fg = cp.blue },
            IndentBlanklineIndent1 = { style = "nocombine", fg = cp.magenta },
        },

        lsp = {
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
        },

        telescope = {
            TelescopeBorder = { fg = cp.subtle },
            TelescopeSelectionCaret = { fg = cp.red },
            TelescopeSelection = { fg = cp.fg, bg = cp.highlight_overlay },
            TelescopeMatching = { fg = cp.fg, style = "bold" },
        },

        treesitter = {
            -- TSAnnotation = {},
            -- TSAttribute = {},
            TSBoolean = { fg = cp.orange },
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
            htmlArg = { fg = cp.magenta },
            htmlEndTag = { fg = cp.subtle },
            htmlLink = { fg = cp.fg },
            htmlTag = { fg = cp.subtle },
            htmlTagN = { fg = cp.fg },
            htmlTagName = { fg = cp.green },
        },

        md = {
            markdownHeadingDelimiter = { fg = cp.subtle },
            markdownCode = { fg = cp.yellow },
            markdownCodeDelimiter = { fg = cp.green },
            markdownCodeBlock = { fg = cp.green },
            markdownH1 = { fg = cp.red, style = "bold" },
            markdownH2 = { fg = cp.red, style = "bold" },
            markdownLinkText = { fg = cp.red },
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
