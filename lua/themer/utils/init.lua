--- @class util
local util = {}

local g = vim.g
local ns = vim.api.nvim_create_namespace("themer")
local set_hl_ns = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local config = require('themer.config').options

util.ns = ns
util.bg = "#000000"
util.fg = "#ffffff"
util.brightness = 0.3

--- hex to rgb
--- @param hex string
function util.hex2rgb(hex)
    hex = hex:gsub("#", "")
    return { tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6)) }
end

--- blend colors
--- @param fg string
--- @param bg string
--- @param alpha number
function util.blend(fg, bg, alpha)
    bg = util.hex2rgb(bg)
    fg = util.hex2rgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

--- darken colors
--- @param hex string
--- @param amount number
--- @param bg string
function util.darken(hex, amount, bg)
    return util.blend(hex, bg or util.bg, math.abs(amount))
end

--- lighten colors
--- @param hex string
--- @param amount number
--- @param fg string
function util.lighten(hex, amount, fg)
    return util.blend(hex, fg or util.fg, math.abs(amount))
end

--- highlight using :highlight
--- @param group string
--- @param color table
function util.highlight(group, color)
    -- Doc: :h highlight-gui
    if color.link then
        vim.cmd("highlight! link " .. group .. " " .. color.link)
else
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or "guisp=NONE"
	local style = color.italic and "gui=italic" or color.bold and "gui=bold" or color.underline and "gui=underline" or color.undercurl and "gui=undercurl" or color.strikethrough and "gui=strikethrough" or color.reverse and "gui=reverse" or color.inverse and "gui=inverse" or color.standout and "gui=standout" or color.nocombine and "gui=nocombine" or "gui=NONE"
    local hl = table.concat({"highlight", group, fg, bg, sp, style}, " ")
    vim.cmd(hl)
    end
end

--- sets highlights using nvim_set_hl()
--- @param hl_group string
--- @param hl_value table
function util.highlight_ns(hl_group, hl_value)
    vim.api.nvim_set_hl(util.ns, hl_group, hl_value)
end

function util.check_change()
    vim.api.nvim_buf_clear_namespace(0, util.ns, 0, -1)
    set_hl_ns(0)
end

--- Highlight on basis of given group and color
--- @param tbl table
function util.syntax(tbl)
    for hl_group, hl_value in pairs(tbl) do
        util.set_hl(hl_group, hl_value)
    end
end

--- set properties
--- @param tbl table
function util.properties(tbl)
    for property, value in pairs(tbl) do
        vim.o[property] = value
    end
end

--- Set terminal colors
--- @param clrs table
function util.terminal(clrs)
    g.terminal_color_0 = clrs.bg
    g.terminal_color_1 = clrs.red
    g.terminal_color_2 = clrs.green
    g.terminal_color_3 = clrs.yellow
    g.terminal_color_4 = clrs.blue
    g.terminal_color_5 = clrs.magenta
    g.terminal_color_6 = clrs.green
    g.terminal_color_7 = clrs.fg

    g.terminal_color_8 = clrs.bg
    g.terminal_color_9 = clrs.red
    g.terminal_color_10 = clrs.green
    g.terminal_color_11 = clrs.yellow
    g.terminal_color_12 = clrs.blue
    g.terminal_color_13 = clrs.magenta
    g.terminal_color_14 = clrs.cyan
    g.terminal_color_15 = clrs.fg
end

--- load a given theme
--- @param theme table
function util.load(theme)
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    if config.term_colors then
        util.terminal(theme.colors)
    end

    util.set_hl = config.modes.use_vim_cmd and util.highlight or util.highlight_ns

    util.properties(theme.properties)
    util.syntax(theme.hig_groups)

    -- Let's hope gobal namespace will be merged soon :sadgepray:
    util.highlight("Normal", theme.hig_groups.Normal)

    if not config.modes.use_vim_cmd then
        vim.cmd([[au ColorSchemePre * :lua require("themer.utils").check_change()]])
        set_hl_ns(util.ns)
    end
end

return util
