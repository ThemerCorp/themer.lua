local util = require("themer.utils.util")

local colors = {
    none = "NONE",
    bg = "#2e3440", -- nvim bg
    bg_highlight = "#373e4a",
    fg_gutter = "#4c566a",
    gray = "#3b4048",
    red = "#d4d198",
    green = "#98c379",
    yellow = "#d94848",
    blue = "#5d8ac2",
    magenta = "#4ec9b0",
    cyan = "#c487b9",
    white = "#e5e9f0",
    comment = "#699856",
}

colors.fg = util.lighten("#5d8ac2", 0.9, colors.white) -- fg color (text)
colors.pink = util.lighten(colors.red, 0.8, colors.white)
colors.orange = util.blend(colors.red, colors.yellow, 0.7)
colors.black_br = colors.black
colors.red_br = colors.red
colors.green_br = colors.green
colors.yellow_br = colors.yellow
colors.blue_br = colors.fg
colors.magenta_br = colors.magenta
colors.cyan_br = colors.cyan
colors.white_br = colors.white
colors.orange_br = colors.orange
colors.pink_br = util.lighten(colors.red, 0.5, colors.white)

-- Some extra colors which require some util functions
colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
colors.fg_alt = util.darken(colors.fg, 0.80, "#000000")

colors.black = util.darken(colors.bg, 0.8, "#000000")

return colors
