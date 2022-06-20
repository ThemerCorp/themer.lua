local base = {
  base00 = "#121316",
  base01 = "#121316",
  base02 = "#1c1d20",
  base03 = "#26272a",
  base04 = "#303134",
  base05 = "#e2e2e2",
  base06 = "#ececec",
  base07 = "#F6F6F6",
  base08 = "#33dbac",
  base09 = "#ff9700",
  base0A = "#ffd945",
  base0B = "#ff3f4f",
  base0C = "#81f900",
  base0D = "#19d1e5",
  base0E = "#e373ce",
  base0F = "#ff3f4f",

  darker_black = "#0a0d11",
}

base.blue = base.base0D
base.green = base.base0C
base.magenta = base.base0E
base.orange = base.base09
base.red = base.base0F
base.teal = base.base08
base.white = base.base07
base.yellow = base.base0A

local cp = {
  -- Legacy colors for compatibility
  blue = base.blue,
  teal = base.teal,
  green = base.green,
  magenta = base.magenta,
  orange = base.orange,
  red = base.red,
  yellow = base.yellow,

  accent = base.base0C,
  bg = {
    base = base.base00,
    alt = base.darker_black,
    selected = base.base04,
  },
  border = base.blue,
  diagnostic = {
    error = base.red,
    warn = base.yellow,
    info = base.green,
    hint = base.magenta,
  },
  diff = {
    add = base.green,
    remove = base.red,
    text = base.blue,
    change = base.yellow,
  },
  dimmed = {
    inactive = base.base03,
    subtle = base.base04,
  },
  directory = base.blue,
  fg = base.white,
  heading = {
    h1 = "#1a66d1",
    h2 = "#1a66d1",
  },
  inc_search = {
    fg = base.base01,
    bg = base.base09,
  },
  match = base.base06,
  pum = {
    fg = base.base06,
    bg = base.base02,
    sbar = base.base03,
    thumb = base.blue,
    sel = {
      bg = base.teal,
      fg = base.base05,
    },
  },
  search_result = {
    fg = base.base01,
    bg = base.base0A,
    telescope = base.base0A,
  },
  built_in = {
    ["function"] = base.green,
    type = base.blue,
    variable = base.red,
    keyword = base.red,
    constant = base.blue,
  },
  syntax = {
    statement = base.orange,
    ["function"] = base.green,
    variable = base.white,
    include = base.red,
    keyword = base.red,
    struct = base.red,
    string = base.yellow,
    identifier = base.orange,
    field = base.white,
    parameter = base.orange,
    property = base.orange,
    punctuation = base.white,
    constructor = base.green,
    operator = base.red,
    preproc = base.yellow,
    constant = base.blue,
    todo = {
      fg = base.base00,
      bg = base.red,
    },
    number = base.magenta,
    comment = base.base04,
    conditional = base.red,
  },
  uri = base.base08,
}

return cp
