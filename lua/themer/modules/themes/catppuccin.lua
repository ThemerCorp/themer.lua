local cpt = {
  rosewater = "#F5E0DC", -- Rosewater
  flamingo = "#F2CDCD", -- Flamingo
  mauve = "#DDB6F2", -- Mauve
  pink = "#F5C2E7", -- Pink
  red = "#F28FAD", -- Red
  maroon = "#E8A2AF", -- Maroon
  peach = "#F8BD96", -- Peach
  yellow = "#FAE3B0", -- Yellow
  green = "#ABE9B3", -- Green
  blue = "#96CDFB", -- Blue
  sky = "#89DCEB", -- Sky
  teal = "#B5E8E0", -- Teal
  lavender = "#C9CBFF", -- Lavender
  white = "#D9E0EE", -- White
  gray2 = "#C3BAC6", -- Gray2
  gray1 = "#988BA2", -- Gray1
  gray0 = "#6E6C7E", -- Gray0
  black4 = "#575268", -- Black4
  black3 = "#302D41", -- Black3
  black2 = "#1E1D2F", -- Black2
  black1 = "#1A1823", -- Black1
  black0 = "#131020", -- Black0
}

local cp = {
  -- Legacy colors for compatibility
  red = cpt.red,
  yellow = cpt.yellow,
  orange = cpt.peach,
  magenta = cpt.mauve,
  blue = cpt.blue,
  green = cpt.green,
  cyan = cpt.teal,

  -- The new shiny boy
  fg = cpt.white,
  diff = {
    add = cpt.green,
    remove = cpt.red,
    text = cpt.blue,
    change = cpt.yellow,
  },
  accent = cpt.blue,
  search_result = { fg = cpt.pink, bg = cpt.black4, telescope = cpt.blue },
  match = cpt.white,
  dimmed = {
    inactive = cpt.black4,
    subtle = cpt.gray0,
  },
  bg = {
    base = cpt.black2,
    alt = cpt.black1,
    selected = cpt.black3,
  },
  border = cpt.blue,
  syntax = {
    statement = cpt.mauve,
    ["function"] = cpt.blue,
    variable = cpt.fg,
    include = cpt.pink,
    keyword = cpt.red,
    struct = cpt.yellow,
    string = cpt.green,
    field = cpt.rosewater,
    parameter = cpt.flamingo,
    property = cpt.yellow,
    punctuation = cpt.teal,
    constructor = cpt.lavender,
    operator = cpt.sky,
    preproc = cpt.pink,
    constant = cpt.peach,
    todo = { fg = cpt.black4, bg = cpt.yellow },
    number = cpt.peach,
    comment = cpt.gray0,
    type = cpt.yellow,
    conditional = cpt.pink,
  },
  built_in = {
    ["function"] = cpt.peach,
    type = cpt.yellow,
    variable = cpt.teal,
    keyword = cpt.maroon,
    constant = cpt.lavender,
  },
  diagnostic = {
    error = cpt.red,
    warn = cpt.yellow,
    info = cpt.sky,
    hint = cpt.rosewater,
  },
  inc_search = { fg = "#575268", bg = "#f5c2e7" },
  uri = cpt.flamingo,
  pum = {
    fg = cpt.gray2,
    bg = cpt.black3,
    sbar = cpt.black4,
    thumb = cpt.gray0,
    sel = {
      bg = cpt.black4,
      fg = cpt.white,
    },
  },
  heading = {
    h1 = cpt.pink,
    h2 = cpt.blue,
  },
}

cp.remaps = {
  plugins = {
    treesitter = {
      -- bash
      bashTSFuncBuiltin = { fg = cpt.red, italic = true },
      bashTSParameter = { fg = cpt.yellow, italic = true },

      -- lua
      luaTSField = { fg = cpt.lavender },
      luaTSConstructor = { fg = cpt.flamingo },

      -- java
      javaTSConstant = { fg = cpt.teal },

      -- typescript
      typescriptTSProperty = { fg = cpt.lavender, italic = true }, -- Same as TSField.

      -- css
      cssTSType = { fg = cpt.lavender },
      cssTSProperty = { fg = cpt.yellow, italic = true }, -- Same as TSField.
    },
  },
}

return cp
