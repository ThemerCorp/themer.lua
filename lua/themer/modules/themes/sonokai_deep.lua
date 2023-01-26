-- Based on https://github.com/sainnhe/sonokai

local colors = {
  bg = "#161C23",
  mBg = "#1c232c",
  lBg = "#1E2A35",

  white = "#e2e2e3",
  blue = "#76cce0",
  lBlue = "#85d3f2",
  rBlue = "#034c65",
  yellow = "#e7c664",
  magenta = "#b39df3",

  green = "#9ed072",
  lGreen = "#a7df78",
  rGreen = "#394634",

  orange = "#f39660",
  red = "#fc5d7c",
  rRed = "#55393d",

  lGray = "#7f8490",
  gray = "#414550",
  rGray = "#3A5166",

  cyan = "#354157",
}

local cp = {
  blue = colors.blue,
  cyan = colors.cyan,
  green = colors.green,
  magenta = colors.magenta,
  orange = colors.orange,
  red = colors.red,
  yellow = colors.yellow,

  bg = { base = colors.bg, alt = colors.bg, selected = colors.lBg },
  fg = colors.white,

  accent = colors.magenta,
  border = colors.lGray,
  cursorlinenr = colors.white,
  uri = colors.blue,

  diagnostic = {
    info = colors.lBlue,
    warn = colors.yellow,
    hint = colors.white,
    error = colors.red,
  },

  diff = { remove = colors.rRed, add = colors.rGreen, text = colors.blue, change = colors.cyan },
  dimmed = { subtle = colors.lGray, inactive = colors.gray },
  gitsigns = { remove = colors.red, add = colors.green, change = colors.blue },

  heading = { h2 = "#0", h1 = colors.red },

  inc_search = { fg = colors.red, bg = colors.bg },
  search_result = { bg = colors.lGreen, fg = colors.bg, telescope = colors.lGreen },
  match = colors.lGreen,

  pum = {
    thumb = colors.lGray,
    fg = colors.white,
    bg = colors.bg,
    sel = { bg = colors.lBlue, fg = colors.bg },
    sbar = colors.bg,
  },
  built_in = {
    ["function"] = colors.green,
    variable = colors.white,
    type = colors.blue,
    constant = colors.orange,
    keyword = colors.red,
  },
  syntax = {
    ["function"] = colors.green,
    variable = colors.white,
    type = colors.blue,
    constant = colors.orange,
    keyword = colors.red,
    operator = colors.magenta,
    comment = colors.lGray,
    number = colors.magenta,
    struct = colors.blue,
    parameter = colors.white,
    preproc = colors.red,
    tag = colors.blue,
    include = colors.red,
    punctuation = colors.lGray,
    constructor = colors.green,
    statement = colors.red,
    todo = { bg = "#0", fg = colors.blue },
    conditional = colors.orange,
    field = colors.blue,
    string = colors.yellow,
    property = colors.white,
  },
}
cp.remaps = {
  base = {
    Normal = { fg = colors.white, bg = colors.bg },
    Directory = { fg = colors.blue },
    EndOfBuffer = { fg = colors.bg },
    ErrorMsg = { fg = colors.white, bg = colors.red },
    VertSplit = { fg = colors.lGray, bg = colors.bg },
    ColorColumn = { bg = colors.lBg },
  },

  plugins = {
    cmp = {
      CmpItemMenu = { fg = colors.blue },
    },

    treesitter = {
      ["@symbol"] = { link = "ThemerType" },
    },

    telescope = {
      TelescopeMatching = { fg = colors.yellow },
      TelescopeTitle = { fg = colors.blue, bg = colors.bg },
      TelescopePromptCounter = { fg = colors.yellow },
      TelescopePromptPrefix = { fg = colors.yellow },
      TelescopeSelectionCaret = { fg = colors.yellow, bg = colors.bg },
    },

    lsp = {

      DiagnosticUnderlineError = { fg = "#0", style = "undercurl" },
      DiagnosticUnderlineWarn = { fg = "#0", style = "undercurl" },
      DiagnosticUnderlineInfo = { fg = "#0", style = "undercurl" },
      DiagnosticUnderlineHint = { fg = "#0", style = "undercurl" },

      DiagnosticVirtualTextError = { fg = colors.gray, style = "italic" },
      DiagnosticVirtualTextWarn = { fg = colors.gray, style = "italic" },
      DiagnosticVirtualTextInfo = { fg = colors.gray, style = "italic" },
      DiagnosticVirtualTextHint = { fg = colors.gray, style = "italic" },
    },
  },
}

return cp
