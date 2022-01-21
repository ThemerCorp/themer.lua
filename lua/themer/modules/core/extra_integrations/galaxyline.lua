local hi = {}

---set galaxyline_colors
---@param cs string
---@param cp table
function hi.get(cs, cp)
    local galaxyline_colors = require("galaxyline.themes.colors")

    galaxyline_colors[cs or require("themer.config")("get").colorscheme] = {
        bg = cp.bg.alt,
        fg = cp.fg,
        fg_alt = cp.dimmed.subtle,
        yellow = cp.yellow,
        cyan = cp.cyan,
        green = cp.green,
        orange = cp.orange,
        magenta = cp.magenta,
        blue = cp.blue,
        red = cp.red,
    }
end

return hi
