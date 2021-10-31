local hi = {}

---set galaxyline_colors
---@param cs string
---@param cp table
function hi.get(cs, cp)
    local present, galaxyline_colors = pcall(require, "galaxyline.themes.colors")
    if not present then
        return
    end

    galaxyline_colors[cs or require("themer.config").options.colorscheme] = {
        bg = cp.bg_highlight,
        fg = cp.fg,
        fg_alt = cp.fg_alt,
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
