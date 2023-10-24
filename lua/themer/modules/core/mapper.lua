local config = require("themer.config")("get")
local fg_or_style = require("themer.modules.core.utils").fg_or_style

---@return table a cleaned styles
---@param cp table
---@return table
local function remap_styles(cp)
  local groups = {
    heading = {
      h1 = { style = "bold", fg = cp.heading.h1 or cp.fg },
      h2 = { style = "bold", fg = cp.heading.h2 or cp.fg },
    },
    ["function"] = fg_or_style(cp.syntax["function"]),
    functionBuiltIn = fg_or_style(cp.built_in["function"]),
    variable = fg_or_style(cp.syntax.variable),
    variableBuiltIn = fg_or_style(cp.built_in.variable),
    include = fg_or_style(cp.syntax.include),
    identifier = fg_or_style(cp.syntax.identifier or cp.syntax.identifier),
    keyword = fg_or_style(cp.syntax.keyword),
    keywordBuiltIn = fg_or_style(cp.built_in.keyword),
    struct = fg_or_style(cp.syntax.struct),
    string = fg_or_style(cp.syntax.string),
    parameter = fg_or_style(cp.syntax.parameter),
    field = fg_or_style(cp.syntax.field),
    type = fg_or_style(cp.syntax.type),
    typeBuiltIn = fg_or_style(cp.built_in.type),
    property = fg_or_style(cp.syntax.property or cp.syntax.variable),
    comment = fg_or_style(cp.syntax.comment or cp.dimmed.subtle),
    punctuation = fg_or_style(cp.syntax.punctuation),
    preproc = fg_or_style(cp.syntax.preproc),
    constructor = fg_or_style(cp.syntax.constructor or cp.syntax.punctuation),
    operator = fg_or_style(cp.syntax.operator or cp.sytax.punctuation),
    constant = fg_or_style(cp.syntax.constant),
    constantBuiltIn = fg_or_style(cp.built_in.constant),
    todo = fg_or_style(cp.syntax.todo),
    character = fg_or_style(cp.syntax.character or cp.syntax.string or cp.fg),
    conditional = fg_or_style(cp.syntax.conditional),
    number = fg_or_style(cp.syntax.number),
    statement = fg_or_style(cp.syntax.statement or cp.accent),
    uri = fg_or_style(cp.uri, { style = "underline" }),
    diagnostic = {
      underline = {
        error = { fg = cp.diagnostic.error, style = config.diagnostic_underline or "undercurl" },
        warn = { fg = cp.diagnostic.warn, style = config.diagnostic_underline or "undercurl" },
        info = { fg = cp.diagnostic.info, style = config.diagnostic_underline or "undercurl" },
        hint = { fg = cp.diagnostic.hint, style = config.diagnostic_underline or "undercurl" },
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

  cp.gitsigns = cp.gitsigns or cp.diff

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
    ThemerSearchResult = { bg = cp.search_result.bg, fg = cp.search_result.fg, bold = true },
    -- see :h hlsearch and do :set hlserch to see it in action

    -- git diffs
    DiffAdd = { bg = cp.diff.add, fg = "NONE" },
    DiffChange = { bg = cp.diff.change, fg = "NONE" },
    DiffText = { bg = cp.diff.text or cp.fg, fg = "NONE" },
    DiffDelete = { bg = cp.diff.remove or cp.diff.delete, fg = "NONE" },
    GitSignsAdd = { fg = cp.gitsigns.add, bg = "NONE" },
    GitSignsDelete = { fg = cp.gitsigns.delete or cp.gitsigns.remove, bg = "NONE" },
    GitSignsChange = { fg = cp.gitsigns.change, bg = "NONE" },
    diffAdded = {
      link = "DiffAdd",
    },
    diffRemoved = {
      link = "DiffDelete",
    },
    diffChanged = {
      link = "DiffChange",
    },

    -- syntax highlighting
    ThemerFunction = groups["function"],
    ThemerFunctionBuiltIn = groups.functionBuiltIn,
    ThemerVariable = groups.variable,
    ThemerVariableBuiltIn = groups.variableBuiltIn,
    ThemerInclude = groups.include,
    ThemerIdentifier = groups.identifier,
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
    ThemerPreProc = groups.preproc,
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
    EndOfBuffer = { fg = cp.bg.base },
    ErrorMsg = { link = "DiagnosticError" },
    Todo = { link = "ThemerTodo" },
    FloatBorder = { link = "ThemerBorder" },
    Folded = { link = "ThemerNormalFloat" },
    IncSearch = cp.inc_search or { link = "ThemerSearchResult" },
    LineNr = { link = "ThemerSubtle" },
    MatchParen = { link = "ThemerNormalFloat" },
    -- ModeMsg = {},
    MoreMsg = { link = "DiagnosticInfo" },
    NonText = { link = "ThemerDimmed" },
    Normal = { fg = cp.fg, bg = cp.bg.base },
    NormalNC = config.dim_inactive and { fg = cp.dimmed.subtle, bg = cp.bg.darker or cp.bg.alt } or {
      link = "Normal",
    },
    NormalFloat = { fg = cp.fg, bg = cp.bg.alt },
    Pmenu = { fg = cp.pum.fg or cp.dimmed.subtle, bg = cp.pum.bg or cp.bg.alt },
    PmenuSbar = { bg = cp.pum.sbar or cp.bg.selected },
    PmenuSel = { bg = cp.pum.sel.bg, fg = cp.pum.sel.fg },
    PmenuThumb = { bg = cp.pum.thumb or cp.dimmed.subtle },
    Question = { link = "MoreMsg" },
    -- QuickFixLine = {},
    Search = { link = "ThemerSearchResult" },
    SpecialKey = { link = "NonText" },
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
    WarningMsg = { link = "DiagnosticWarn" },
    -- Boolean = { link = "ThemerConstant" },
    Character = { link = "ThemerCharacter" },
    Comment = { link = "ThemerComment" },
    Conditional = { link = "ThemerConditional" },
    Constant = { link = "ThemerConstant" },
    -- Debug = { fg = cp.debug },
    -- Define = { fg = cp.magenta },
    Delimiter = { link = "ThemerPunctuation" },
    Error = { link = "DiagnosticError" },
    -- Exception = { fg = cp.blue },
    Float = { link = "ThemerNumber" },
    Function = { link = "ThemerFunction" },
    Identifier = { link = "ThemerIdentifier" },
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
      DiagnosticSignError = { link = "DiagnosticError" },
      DiagnosticSignWarn = { link = "DiagnosticWarn" },
      DiagnosticSignInfo = { link = "DiagnosticInfo" },
      DiagnosticSignHint = { link = "DiagnosticHint" },

      DiagnosticDefaultError = { link = "DiagnosticError" },
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
      -- ["@annotation"] = {},
      -- TSAnnotation = {},
      -- ["@attribute"] = {},
      -- TSAttribute = {},
      -- ["@boolean"] = { fg = cp.orange },
      -- TSBoolean = { fg = cp.orange },
      -- ["@character"] = {},
      -- TSCharacter = {},
      -- ["@comment"] = groups.styles.comment,
      -- TSComment = groups.styles.comment,
      ["@note"] = { link = "DiagnosticInfo" },
      TSNote = { link = "DiagnosticInfo" },
      ["@warning"] = { link = "DiagnosticWarn" },
      TSWarning = { link = "DiagnosticWarn" },
      ["@danger"] = { link = "DiagnosticError" },
      TSDanger = { link = "DiagnosticError" },
      ["@conditional"] = { link = "ThemerConditional" },
      TSConditional = { link = "ThemerConditional" },
      ["@constant.builtin"] = { link = "ThemerConstantBuiltIn" },
      TSConstBuiltin = { link = "ThemerConstantBuiltIn" },
      -- ["@constant.macro"] = {},
      -- TSConstMacro = {},
      ["@constant"] = { link = "ThemerConstant" },
      TSConstant = { link = "ThemerConstant" },
      ["@constructor"] = { link = "ThemerConstructor" },
      TSConstructor = { link = "ThemerConstructor" },
      -- ["@text.emphasis"] = {},
      -- TSEmphasis = {},
      -- ["@error"] = {},
      -- TSError = {},
      -- ["@exception"] = {},
      -- TSException = {},
      ["@field"] = { link = "ThemerField" },
      TSField = { link = "ThemerField" },
      -- ["@float"] = {},
      -- TSFloat = {},
      ["@function.builtin"] = { link = "ThemerFunctionBuiltIn" },
      TSFuncBuiltin = { link = "ThemerFunctionBuiltIn" },
      -- ["@function.macro"] = {},
      -- TSFuncMacro = {},
      ["@function"] = { link = "ThemerFunction" },
      TSFunction = { link = "ThemerFunction" },
      ["@include"] = { link = "ThemerInclude" },
      TSInclude = { link = "ThemerInclude" },
      ["@keyword"] = { link = "ThemerKeyword" },
      TSKeyword = { link = "ThemerKeyword" },
      ["@keyword.function"] = { link = "ThemerKeywordBuiltIn" },
      TSKeywordFunction = { link = "ThemerKeywordBuiltIn" },
      ["@keyword.return"] = { link = "ThemerKeywordBuiltIn" },
      TSKeywordReturn = { link = "ThemerKeywordBuiltIn" },
      ["@keyword.operator"] = { link = "ThemerOperator" },
      TSKeywordOperator = { link = "ThemerOperator" },
      -- ["@label"] = {},
      -- TSLabel = {},
      -- ["@text.literal"] = {},
      -- TSLiteral = {},
      -- ["@method"] = {},
      -- TSMethod = {},
      -- ["@namespace"] = {},
      -- TSNamespace = {},
      -- ["@none"] = {},
      -- TSNone = {},
      -- ["@number"] = {},
      -- TSNumber = {},
      ["@operator"] = { link = "ThemerOperator" },
      TSOperator = { link = "ThemerOperator" },
      ["@parameter"] = { link = "ThemerParameter" },
      TSParameter = { link = "ThemerParameter" },
      -- ["@parameter.reference"] = {},
      -- TSParameterReference = {},
      ["@property"] = { link = "ThemerProperty" },
      TSProperty = { link = "ThemerProperty" },
      ["@punctuation.bracket"] = { link = "ThemerPunctuation" },
      TSPunctBracket = { link = "ThemerPunctuation" },
      ["@punctuation.delimiter"] = { link = "ThemerPunctuation" },
      TSPunctDelimiter = { link = "ThemerPunctuation" },
      ["@punctuation.special"] = { link = "ThemerPunctuation" },
      TSPunctSpecial = { link = "ThemerPunctuation" },
      -- ["@repeat"] = {},
      -- TSRepeat = {},
      -- ["@text.strike"] = {},
      -- TSStrike = {},
      ["@string"] = { link = "ThemerString" },
      TSString = { link = "ThemerString" },
      -- ["@string.escape"] = { fg = cp.blue },
      -- TSStringEscape = { fg = cp.blue },
      -- ["@string.regex"] = {},
      -- TSStringRegex = {},
      -- ["@symbol"] = {},
      -- TSSymbol = {},
      ["@tag"] = groups.tag or groups.statement,
      TSTag = groups.tag or groups.statement,
      ["@tag.delimiter"] = { link = "ThemerSubtle" },
      TSTagDelimiter = { link = "ThemerSubtle" },
      ["@text"] = { link = "ThemerText" },
      TSText = { link = "ThemerText" },
      ["@text.title"] = { link = "ThemerHeadingH1" },
      TSTitle = { link = "ThemerHeadingH1" },
      ["@type"] = { link = "ThemerType" },
      TSType = { link = "ThemerType" },
      ["@type.builtin"] = { link = "ThemerTypeBuiltIn" },
      TSTypeBuiltin = { link = "ThemerTypeBuiltIn" },
      ["@text.uri"] = { link = "ThemerURI" },
      TSURI = { link = "ThemerURI" },
      -- ["@text.underline"] = {},
      -- TSUnderline = {},
      ["@variable"] = { link = "ThemerVariable" },
      TSVariable = { link = "ThemerVariable" },
      ["@variable.builtin"] = { link = "ThemerVariableBuiltIn" },
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
    },

    md = {
      markdownH2 = { link = "ThemerHeadingH2" },
      markdownH1 = { link = "ThemerHeadingH1" },
      markdownUrl = { link = "ThemerURI" },
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
    cp.remaps or {},
    config.remaps.highlights.globals or {},
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
