local util = require("themer.utils.util")

local colors = {
    none = "NONE",
    bg = "#191724", -- nvim bg
    bg_highlight = "#2a2837",
    fg = "#e0def4", -- fg color (text)
    fg_gutter = "#6e6a86",
    black = "#211f2d",
    gray = "#3a384a",
    red = "#eb6f92",
    green = "#9ccfd8",
    yellow = "#f6c177",
    blue = "#31748f",
    magenta = "#c4a7e7",
    cyan = "#9ccfd8",
    white = "#e0def4",
    orange = "#ebbcba",
    pink = "#ebbcba",
    comment = "#555169",
}


-- rose pine has no bright colors 😢
colors.black_br = colors.black
colors.red_br = colors.red
colors.green_br = colors.green
colors.yellow_br = colors.yellow
colors.blue_br = colors.blue
colors.magenta_br = colors.magenta
colors.cyan_br = colors.cyan
colors.white_br = colors.white
colors.orange_br = colors.orange
colors.pink_br = colors.pink

-- Some extra colors which require some util functions
colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
colors.fg_alt = util.darken(colors.fg, 0.80, "#000000")

colors.black = util.darken(colors.bg, 0.8, "#000000")

return colors
