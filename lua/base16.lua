-- ┏┓ ┏━┓┏━┓┏━╸╺┓ ┏━┓ ┏┓╻╻ ╻╻┏┳┓
-- ┣┻┓┣━┫┗━┓┣╸  ┃ ┣━┓ ┃┗┫┃┏┛┃┃┃┃
-- ┗━┛╹ ╹┗━┛┗━╸╺┻╸┗━┛╹╹ ╹┗┛ ╹╹ ╹

-- The hl function is inspired from https://github.com/norcalli/nvim-base16.lua

local function hl(group, guifg, guibg, gui, guisp)
    local parts = { group }
    if guifg then
        table.insert(parts, "guifg=#" .. guifg)
    end
    if guibg then
        table.insert(parts, "guibg=#" .. guibg)
    end
    if gui then
        table.insert(parts, "gui=" .. gui)
    end
    if guisp then
        table.insert(parts, "guisp=#" .. guisp)
    end
    vim.api.nvim_command("highlight " .. table.concat(parts, " "))
end

local function high_link(group, link)
    vim.api.nvim_command("hi! link " .. group .. " " .. link)
end

-- ╻ ╻╻┏━╸╻ ╻╻  ╻┏━╸╻ ╻╺┳╸╻┏┓╻┏━╸   ┏┓ ┏━╸┏━╸╻┏┓╻┏━┓
-- ┣━┫┃┃╺┓┣━┫┃  ┃┃╺┓┣━┫ ┃ ┃┃┗┫┃╺┓   ┣┻┓┣╸ ┃╺┓┃┃┗┫┗━┓
-- ╹ ╹╹┗━┛╹ ╹┗━╸╹┗━┛╹ ╹ ╹ ╹╹ ╹┗━┛   ┗━┛┗━╸┗━┛╹╹ ╹┗━┛

local function apply_base16_theme(theme)
    -- Clearing earlier highlights
    vim.cmd([[hi clear]])
    vim.cmd([[syntax reset]])
    -- Neovim terminal colours
    vim.g.terminal_color_0 = "#" .. theme.base00
    vim.g.terminal_color_1 = "#" .. theme.base08
    vim.g.terminal_color_2 = "#" .. theme.base0B
    vim.g.terminal_color_3 = "#" .. theme.base0A
    vim.g.terminal_color_4 = "#" .. theme.base0D
    vim.g.terminal_color_5 = "#" .. theme.base0E
    vim.g.terminal_color_6 = "#" .. theme.base0C
    vim.g.terminal_color_7 = "#" .. theme.base05
    vim.g.terminal_color_8 = "#" .. theme.base03
    vim.g.terminal_color_9 = "#" .. theme.base08
    vim.g.terminal_color_10 = "#" .. theme.base0B
    vim.g.terminal_color_0A = "#" .. theme.base0A
    vim.g.terminal_color_0B = "#" .. theme.base0D
    vim.g.terminal_color_0C = "#" .. theme.base0E
    vim.g.terminal_color_0D = "#" .. theme.base0C
    vim.g.terminal_color_0E = "#" .. theme.base07
    if vim.o.background == "light" then
        vim.g.terminal_color_background = "#" .. theme.base05
        vim.g.terminal_color_foreground = "#" .. theme.base0B
    else
        vim.g.terminal_color_background = "#" .. theme.base00
        vim.g.terminal_color_foreground = "#" .. theme.base0E
    end

    --  ┏━╸╺┳┓╻╺┳╸┏━┓┏━┓   ┏━╸┏━┓╻  ┏━┓┏━┓┏━┓
    --  ┣╸  ┃┃┃ ┃ ┃ ┃┣┳┛   ┃  ┃ ┃┃  ┃ ┃┣┳┛┗━┓
    --  ┗━╸╺┻┛╹ ╹ ┗━┛╹┗╸   ┗━╸┗━┛┗━╸┗━┛╹┗╸┗━┛

    if vim.g.base16_disable_background then
        hl("Normal", theme.base05, "none", nil, nil)
        hl("NonText", "none", nil, nil, nil)
    else
        hl("Normal", theme.base05, theme.base00, nil, nil)
        hl("NonText", theme.base03, nil, nil, nil)
    end
    hl("Bold", nil, nil, "bold", nil)
    hl("Debug", theme.base08, nil, nil, nil)
    hl("Directory", theme.base0D, nil, nil, nil)
    hl("Error", theme.base00, theme.base08, nil, nil)
    hl("ErrorMsg", theme.base08, theme.base00, nil, nil)
    hl("Exception", theme.base08, nil, nil, nil)
    hl("FoldColumn", theme.base0C, theme.base01, nil, nil)
    hl("Folded", theme.base03, theme.base01, nil, nil)
    hl("IncSearch", theme.base01, theme.base09, "none", nil)
    hl("Italic", nil, nil, "none", nil)
    hl("Macro", theme.base08, nil, nil, nil)
    hl("MatchParen", nil, theme.base03, nil, nil)
    hl("ModeMsg", theme.base0B, nil, nil, nil)
    hl("MoreMsg", theme.base0B, nil, nil, nil)
    hl("Question", theme.base0D, nil, nil, nil)
    hl("Search", theme.base01, theme.base0A, nil, nil)
    hl("Substitute", theme.base01, theme.base0A, "none", nil)
    hl("SpecialKey", theme.base03, nil, nil, nil)
    hl("TooLong", theme.base08, nil, nil, nil)
    hl("Underlined", theme.base08, nil, nil, nil)
    hl("Visual", nil, theme.base02, nil, nil)
    hl("VisualNOS", theme.base08, nil, nil, nil)
    hl("WarningMsg", theme.base08, nil, nil, nil)
    hl("WildMenu", theme.base08, theme.base0A, nil, nil)
    hl("Title", theme.base0D, nil, "none", nil)
    hl("Conceal", theme.base0D, theme.base00, nil, nil)
    hl("Cursor", theme.base00, theme.base05, nil, nil)
    hl("LineNr", theme.base03, "NONE", nil, nil)
    hl("SignColumn", theme.base03, "NONE", nil, nil)
    hl("StatusLine", theme.base04, "NONE", "none", nil)
    hl("StatusLineNC", theme.base03, "NONE", "none", nil)
    hl("VertSplit", theme.base02, "NONE", "none", nil)
    hl("ColorColumn", nil, theme.base01, "none", nil)
    hl("CursorColumn", nil, theme.base01, "none", nil)
    hl("CursorLine", nil, theme.base01, "none", nil)
    hl("CursorLineNr", theme.base04, "NONE", nil, nil)
    hl("QuickFixLine", nil, theme.base01, "none", nil)
    hl("PMenu", theme.base05, theme.base01, "none", nil)
    hl("PMenuSel", theme.base01, theme.base05, nil, nil)
    hl("TabLine", theme.base03, theme.base01, "none", nil)
    hl("TabLineFill", theme.base03, theme.base01, "none", nil)
    hl("TabLineSel", theme.base0B, theme.base01, "none", nil)

    -- Standard syntax hling
    hl("Boolean", theme.base09, nil, nil, nil)
    hl("Character", theme.base08, nil, nil, nil)
    hl("Comment", theme.base03, nil, nil, nil)
    hl("Conditional", theme.base0E, nil, nil, nil)
    hl("Constant", theme.base09, nil, nil, nil)
    hl("Define", theme.base0E, nil, "none", nil)
    hl("Delimiter", theme.base0F, nil, nil, nil)
    hl("Float", theme.base09, nil, nil, nil)
    hl("Function", theme.base0D, nil, nil, nil)
    hl("Identifier", theme.base08, nil, "none", nil)
    hl("Include", theme.base0D, nil, nil, nil)
    hl("Keyword", theme.base0E, nil, nil, nil)
    hl("Label", theme.base0A, nil, nil, nil)
    hl("Number", theme.base09, nil, nil, nil)
    hl("Operator", theme.base05, nil, "none", nil)
    hl("PreProc", theme.base0A, nil, nil, nil)
    hl("Repeat", theme.base0A, nil, nil, nil)
    hl("Special", theme.base0C, nil, nil, nil)
    hl("SpecialChar", theme.base0F, nil, nil, nil)
    hl("Statement", theme.base08, nil, nil, nil)
    hl("StorageClass", theme.base0A, nil, nil, nil)
    hl("String", theme.base0B, nil, nil, nil)
    hl("Structure", theme.base0E, nil, nil, nil)
    hl("Tag", theme.base0A, nil, nil, nil)
    hl("Todo", theme.base0A, theme.base01, nil, nil)
    hl("Type", theme.base0A, nil, "none", nil)
    hl("Typedef", theme.base0A, nil, nil, ni)

    --	┏━╸╻ ╻╺┳╸┏━┓┏━┓   ╺┳┓┏━╸┏━╸╻┏┓╻╻╺┳╸╻┏━┓┏┓╻┏━┓
    --	┣╸ ┏╋┛ ┃ ┣┳┛┣━┫    ┃┃┣╸ ┣╸ ┃┃┗┫┃ ┃ ┃┃ ┃┃┗┫┗━┓
    --	┗━╸╹ ╹ ╹ ╹┗╸╹ ╹   ╺┻┛┗━╸╹  ╹╹ ╹╹ ╹ ╹┗━┛╹ ╹┗━┛

    -- C hling
    hl("cOperator", theme.base0C, nil, nil, nil)
    hl("cPreCondit", theme.base0E, nil, nil, nil)

    -- C# hling
    hl("csClass", theme.base0A, nil, nil, nil)
    hl("csAttribute", theme.base0A, nil, nil, nil)
    hl("csModifier", theme.base0E, nil, nil, nil)
    hl("csType", theme.base08, nil, nil, nil)
    hl("csUnspecifiedStatement", theme.base0D, nil, nil, nil)
    hl("csContextualStatement", theme.base0E, nil, nil, nil)
    hl("csNewDecleration", theme.base08, nil, nil, nil)

    -- CSS hling
    hl("cssBraces", theme.base05, nil, nil, nil)
    hl("cssClassName", theme.base0E, nil, nil, nil)
    hl("cssColor", theme.base0C, nil, nil, nil)

    -- Diff hling
    hl("DiffAdd", theme.base0B, theme.base01, nil, nil)
    hl("DiffChange", theme.base03, theme.base01, nil, nil)
    hl("DiffDelete", theme.base08, theme.base01, nil, nil)
    hl("DiffText", theme.base0D, theme.base01, nil, nil)
    hl("DiffAdded", theme.base0B, theme.base00, nil, nil)
    hl("DiffFile", theme.base08, theme.base00, nil, nil)
    hl("DiffNewFile", theme.base0B, theme.base00, nil, nil)
    hl("DiffLine", theme.base0D, theme.base00, nil, nil)
    hl("DiffRemoved", theme.base08, theme.base00, nil, nil)

    -- Git hling
    hl("gitcommitOverflow", theme.base08, nil, nil, nil)
    hl("gitcommitSummary", theme.base0B, nil, nil, nil)
    hl("gitcommitComment", theme.base03, nil, nil, nil)
    hl("gitcommitUntracked", theme.base03, nil, nil, nil)
    hl("gitcommitDiscarded", theme.base03, nil, nil, nil)
    hl("gitcommitSelected", theme.base03, nil, nil, nil)
    hl("gitcommitHeader", theme.base0E, nil, nil, nil)
    hl("gitcommitSelectedType", theme.base0D, nil, nil, nil)
    hl("gitcommitUnmergedType", theme.base0D, nil, nil, nil)
    hl("gitcommitDiscardedType", theme.base0D, nil, nil, nil)
    hl("gitcommitBranch", theme.base09, nil, "bold", nil)
    hl("gitcommitUntrackedFile", theme.base0A, nil, nil, nil)
    hl("gitcommitUnmergedFile", theme.base08, nil, "bold", nil)
    hl("gitcommitDiscardedFile", theme.base08, nil, "bold", nil)
    hl("gitcommitSelectedFile", theme.base0B, nil, "bold", nil)

    -- HTML hling
    hl("htmlBold", theme.base0A, nil, nil, nil)
    hl("htmlItalic", theme.base0E, nil, nil, nil)
    hl("htmlEndTag", theme.base05, nil, nil, nil)
    hl("htmlTag", theme.base05, nil, nil, nil)

    -- JavaScript hling
    hl("javaScript", theme.base05, nil, nil, nil)
    hl("javaScriptBraces", theme.base05, nil, nil, nil)
    hl("javaScriptNumber", theme.base09, nil, nil, nil)

    -- pangloss/vim-javascript hling
    hl("jsOperator", theme.base0D, nil, nil, nil)
    hl("jsStatement", theme.base0E, nil, nil, nil)
    hl("jsReturn", theme.base0E, nil, nil, nil)
    hl("jsThis", theme.base08, nil, nil, nil)
    hl("jsClassDefinition", theme.base0A, nil, nil, nil)
    hl("jsFunction", theme.base0E, nil, nil, nil)
    hl("jsFuncName", theme.base0D, nil, nil, nil)
    hl("jsFuncCall", theme.base0D, nil, nil, nil)
    hl("jsClassFuncName", theme.base0D, nil, nil, nil)
    hl("jsClassMethodType", theme.base0E, nil, nil, nil)
    hl("jsRegexpString", theme.base0C, nil, nil, nil)
    hl("jsGlobalObjects", theme.base0A, nil, nil, nil)
    hl("jsGlobalNodeObjects", theme.base0A, nil, nil, nil)
    hl("jsExceptions", theme.base0A, nil, nil, nil)
    hl("jsBuiltins", theme.base0A, nil, nil, nil)

    -- Mail hling
    hl("mailQuoted1", theme.base0A, nil, nil, nil)
    hl("mailQuoted2", theme.base0B, nil, nil, nil)
    hl("mailQuoted3", theme.base0E, nil, nil, nil)
    hl("mailQuoted4", theme.base0C, nil, nil, nil)
    hl("mailQuoted5", theme.base0D, nil, nil, nil)
    hl("mailQuoted6", theme.base0A, nil, nil, nil)
    hl("mailURL", theme.base0D, nil, nil, nil)
    hl("mailEmail", theme.base0D, nil, nil, nil)

    -- Markdown hling
    hl("markdownCode", theme.base0B, nil, nil, nil)
    hl("markdownError", theme.base05, theme.base00, nil, nil)
    hl("markdownCodeBlock", theme.base0B, nil, nil, nil)
    hl("markdownHeadingDelimiter", theme.base0D, nil, nil, nil)

    -- PHP hling
    hl("phpMemberSelector", theme.base05, nil, nil, nil)
    hl("phpComparison", theme.base05, nil, nil, nil)
    hl("phpParent", theme.base05, nil, nil, nil)
    hl("phpMethodsVar", theme.base0C, nil, nil, nil)

    -- Python hling
    hl("pythonOperator", theme.base0E, nil, nil, nil)
    hl("pythonRepeat", theme.base0E, nil, nil, nil)
    hl("pythonInclude", theme.base0E, nil, nil, nil)
    hl("pythonStatement", theme.base0E, nil, nil, nil)

    -- Ruby hling
    hl("rubyAttribute", theme.base0D, nil, nil, nil)
    hl("rubyConstant", theme.base0A, nil, nil, nil)
    hl("rubyInterpolationDelimiter", theme.base0F, nil, nil, nil)
    hl("rubyRegexp", theme.base0C, nil, nil, nil)
    hl("rubySymbol", theme.base0B, nil, nil, nil)
    hl("rubyStringDelimiter", theme.base0B, nil, nil, nil)

    -- SASS hling
    hl("sassidChar", theme.base08, nil, nil, nil)
    hl("sassClassChar", theme.base09, nil, nil, nil)
    hl("sassInclude", theme.base0E, nil, nil, nil)
    hl("sassMixing", theme.base0E, nil, nil, nil)
    hl("sassMixinName", theme.base0D, nil, nil, nil)

    -- Spelling hling
    hl("SpellBad", nil, nil, "undercurl", theme.base08)
    hl("SpellLocal", nil, nil, "undercurl", theme.base0C)
    hl("SpellCap", nil, nil, "undercurl", theme.base0D)
    hl("SpellRare", nil, nil, "undercurl", theme.base0E)

    -- Java hling
    hl("javaOperator", theme.base0D, nil, nil, nil)

    -- LspDiagnostic base hl group
    hl("LspDiagnosticsDefaultError", theme.base08, nil, nil, nil)
    hl("LspDiagnosticsDefaultWarning", theme.base0A, nil, nil, nil)
    hl("LspDiagnosticsDefaultInformation", theme.base0D, nil, nil, nil)
    hl("LspDiagnosticsDefaultHint", theme.base0C, nil, nil, nil)

    --	┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
    --	┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
    --	╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛
    -- TreeSitter
    hl("TSStrike", nil, nil, "strikethrough")
    high_link("TSException", "Exception")
    high_link("TSAnnotation", "PreProc")
    high_link("TSAttribute", "Attribute")
    high_link("TSConditional", "Conditional")
    high_link("TSComment", "Comment")
    high_link("TSConstructor", "Structure")
    high_link("TSConstant", "Constant")
    high_link("TSConstBuiltin", "Constant")
    high_link("TSConstMacro", "Macro")
    high_link("TSError", "Error")
    high_link("TSField", "Field")
    high_link("TSFloat", "Float")
    high_link("TSFunction", "Function")
    high_link("TSFuncBuiltin", "FunctionBuiltin")
    high_link("TSFuncMacro", "Macro")
    high_link("TSInclude", "Include")
    high_link("TSKeyword", "Keyword")
    high_link("TSKeywordFunction", "KeywordFunction")
    high_link("TSLabel", "Label")
    high_link("TSMethod", "Method")
    high_link("TSNamespace", "Directory")
    high_link("TSNumber", "Number")
    high_link("TSOperator", "Operator")
    high_link("TSParameter", "Argument")
    high_link("TSParameterReference", "Argument")
    high_link("TSProperty", "Property")
    high_link("TSPunctDelimiter", "Delimiter")
    high_link("TSPunctBracket", "Delimiter")
    high_link("TSPunctSpecial", "Delimiter")
    high_link("TSRepeat", "Repeat")
    high_link("TSString", "String")
    high_link("TSStringRegex", "StringDelimiter")
    high_link("TSStringEscape", "StringDelimiter")
    high_link("TSTag", "Tag")
    high_link("TSTagDelimiter", "Delimiter")
    high_link("TSStrong", "Bold")
    high_link("TSURI", "URL")
    high_link("TSWarning", "Warning")
    high_link("TSDanger", "Error")
    high_link("TSType", "Type")
    high_link("TSTypeBuiltin", "TypeBuiltin")
    high_link("TSVariable", "None")
    high_link("TSVariableBuiltin", "VariableBuiltin")

    -- Indent Blankline hling
    hl("IndentBlanklineChar", theme.base03, nil, nil, nil)

    -- LspSaga
    high_link("LspSagaDiagnosticBorder", "Normal")
    high_link("LspSagaDiagnosticTruncateLine", "Normal")
    high_link("LspFloatWinBorder", "Normal")
    high_link("LspSagaBorderTitle", "Title")
    high_link("TargetWord", "Error")
    high_link("ReferencesCount", "Title")
    high_link("ReferencesIcon", "Special")
    high_link("DefinitionCount", "Title")
    high_link("TargetFileName", "Comment")
    high_link("DefinitionIcon", "Special")
    high_link("ProviderTruncateLine", "Normal")
    high_link("LspSagaFinderSelection", "Search")
    high_link("DiagnosticTruncateLine", "Normal")
    high_link("DiagnosticError", "LspDiagnosticsDefaultError")
    high_link("DiagnosticWarning", "LspDiagnosticsDefaultWarning")
    high_link("DiagnosticInformation", "LspDiagnosticsDefaultInformation")
    high_link("DiagnosticHint", "LspDiagnosticsDefaultHint")
    high_link("DefinitionPreviewTitle", "Title")
    high_link("LspSagaShTruncateLine", "Normal")
    high_link("LspSagaDocTruncateLine", "Normal")
    high_link("LineDiagTuncateLine", "Normal")
    high_link("LspSagaCodeActionTitle", "Title")
    high_link("LspSagaCodeActionTruncateLine", "Normal")
    high_link("LspSagaCodeActionContent", "Normal")
    high_link("LspSagaRenamePromptPrefix", "Normal")
    high_link("LspSagaRenameBorder", "Bold")
    high_link("LspSagaHoverBorder", "Bold")
    high_link("LspSagaSignatureHelpBorder", "Bold")
    high_link("LspSagaCodeActionBorder", "Bold")
    high_link("LspSagaDefPreviewBorder", "Bold")
    high_link("LspLinesDiagBorder", "Bold")

    -- Lsp Diagnostics
    high_link("LspDiagnosticsFloatingError", "ErrorMsg")
    high_link("LspDiagnosticsFloatingWarning", "Warning")
    high_link("LspDiagnosticsFloatingInformation", "MoreMsg")
    high_link("LspDiagnosticsFloatingHint", "Msg")
    high_link("LspDiagnosticsDefaultError", "ErrorMsg")
    high_link("LspDiagnosticsDefaultWarning", "WarningMsg")
    high_link("LspDiagnosticsDefaultInformation", "MoreMsg")
    high_link("LspDiagnosticsDefaultHint", "Msg")
    high_link("LspDiagnosticsVirtualTextError", "ErrorMsg")
    high_link("LspDiagnosticsVirtualTextWarning", "WarningMsg")
    high_link("LspDiagnosticsVirtualTextInformation", "MoreMsg")
    high_link("LspDiagnosticsVirtualTextHint", "Msg")
    high_link("LspDiagnosticsUnderlineError", "ErrorMsgUnderline")
    high_link("LspDiagnosticsUnderlineWarning", "WarningMsgUnderline")
    high_link("LspDiagnosticsUnderlineInformation", "MoreMsgUnderline")
    high_link("LspDiagnosticsUnderlineHint", "MsgUnderline")
    high_link("LspDiagnosticsSignError", "ErrorMsg")
    high_link("LspDiagnosticsSignWarning", "WarningMsg")
    high_link("LspDiagnosticsSignInformation", "MoreMsg")
    high_link("LspDiagnosticsSignHint", "Msg")
    high_link("LspReferenceText", "Bold")
    high_link("LspReferenceRead", "Bold")
    high_link("LspReferenceWrite", "Bold")
    high_link("TermCursor", "Cursor")
    high_link("healthError", "ErrorMsg")
    high_link("healthSuccess", "Msg")
    high_link("healthWarning", "WarningMsg")
end

return setmetatable({
    themes = function(theme_name)
        name = "themes." .. theme_name
        local present, theme_array = pcall(require, name)
        if present then
            vim.g["colors_name"] = theme_name
            return theme_array
        else
            error("No such theme: " .. theme_name)
        end
    end,
    apply_theme = apply_base16_theme,
    theme_from_array = function(array)
        assert(#array == 16, "base16.theme_from_array: The array length must be 16")
        local result = {}
        for i, value in ipairs(array) do
            assert(#value == 6, "base16.theme_from_array: array values must be in 6 digit hex format, e.g. 'ffffff'")
            local key = ("base%02X"):format(i - 1)
            result[key] = value
        end
        return result
    end,
}, {
    __call = function(_, ...)
        apply_base16_theme(...)
    end,
})
