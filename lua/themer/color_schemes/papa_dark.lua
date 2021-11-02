local colors = require("themer.utils.json").decode("../color_schemes/json/papa_dark.json")
require("themer").setup({
    colors = {
        comment = colors.comment,
        punctuation = colors.blue,
    },
    styles = {
        keywords = { fg = colors.blue },
        variables = { fg = colors.light_blue },
        parameters = { fg = colors.light_blue },
        string = { fg = colors.string },
        functions = { fg = colors.yellow },
    },
    integrations = {
        native_lsp = {
            virtual_text = {
                hint = { fg = colors.blue },
            },
        },
        telescope = false,
        barbar = false,
    },
})

require("themer").remap_hl_group({
    Normal = { fg = colors.fg, bg = colors.bg },
    ColorColumn = { fg = colors.red },
    CursorLine = { bg = colors.line_color },
    Directory = { fg = colors.blue },
    EndOfBuffer = { fg = colors.bg },
    ErrorMsg = { fg = colors.fg, bg = colors.red },
    VertSplit = { fg = colors.vertsplit },
    Folded = { fg = colors.comment },
    IncSearch = { fg = colors.yellow, bg = colors.comment },
    MatchParen = { fg = colors.fg, bg = colors.blue },
    NonText = { fg = colors.blue },
    Pmenu = { fg = colors.line_color },
    PmenuSbar = { fg = colors.visual_grey },
    PmenuSel = { bg = colors.visual_grey },
    PmenuThumb = { fg = colors.fg },
    Search = { bg = colors.blue },
    TabLine = { fg = colors.comment },
    TabLineSel = { fg = colors.fg },
    TabLineFill = { bg = colors.bg },
    Visual = { bg = colors.visual_grey },
    WarningMsg = { fg = colors.yellow },
    Whitespace = { fg = colors.fg },
    FloatBorder = { fg = colors.fg },

    Constant = { fg = colors.blue },
    Character = { link = "String" },
    Number = { fg = colors.integer },
    Boolean = { link = "Constant" },
    Float = { link = "Number" },

    Identifier = { fg = colors.light_blue },
    Function = { fg = colors.yellow },

    Statement = { fg = colors.blue },

    PreProc = { link = "Statement" },

    Type = { fg = colors.blue },

    Special = { fg = colors.blue },

    Error = { fg = colors.red },

    LspDiagnosticsDefaultError = { undercurl = true, sp = colors.red },
    LspDiagnosticsDefaultWarning = { undercurl = true, sp = colors.yellow },

    TSBoolean = { link = "Boolean" },
    TSCharacter = { link = "Character" },
    TSConstant = { link = "Constant" },
    TSError = { link = "Error" },
    TSField = { fg = colors.light_blue },
    TSFunction = { link = "Function" },
    TSFuncBuiltin = { link = "Function" },
    TSFuncMacro = { link = "Function" },
    TSNamespace = { fg = colors.cyan },
    TSType = { fg = colors.cyan },
    TSTypeBuiltin = { fg = colors.blue },
    TSVariable = { link = "TSField" },
    TSProperty = { link = "TSField" },
    TSKeyword = { fg = colors.blue },
    TSPunctBracket = { fg = colors.blue },
    TSConstructor = { fg = colors.blue },
    TSMethod = { link = "Function" },
    TSKeywordFunction = { link = "Keyword" },
    TSConditional = { link = "Keyword" },
    TSConstBuiltin = { link = "Keyword" },
    TSInclude = { link = "Keyword" },
    TSVariableBuiltin = { link = "Keyword" },
    TSTag = { link = "Keyword" },
    TSTitle = { fg = colors.string },

    GitSignsChange = { fg = colors.yellow, bg = colors.bg },

    CmpItemKind = { fg = colors.blue },

    TroubleSignError = { fg = colors.red },
    TroubleSignWarning = { fg = colors.yellow },

    NvimTreeRootFolder = { fg = colors.light_blue },
    NvimTreeFileDeleted = { fg = colors.red },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeGitDirty = { fg = colors.yellow },

    TelescopeSelection = { bg = colors.highlight_overlay },
    TelescopeMatching = { fg = colors.blue },
})

return colors
