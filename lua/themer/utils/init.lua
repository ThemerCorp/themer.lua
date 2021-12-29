local g = vim.g
local config = require("themer.config")("get")
local exec = vim.api.nvim_command

--- highlight using :highlight
--- @param group string
--- @param color table
local function highlight(group, color)
    local parts = { group }
    parts[#parts + 1] = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    parts[#parts + 1] = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    parts[#parts + 1] = color.sp and "guisp=" .. color.sp or ""
    parts[#parts + 1] = color.style and "gui=" .. color.style or "gui=NONE"

    -- nvim.ex.highlight(parts)
    exec("highlight " .. table.concat(parts, " "))
    if color.link then
        exec("highlight! link " .. group .. " " .. color.link)
    end
end

--- Highlight on basis of given group and color
--- @param tbl table
local function syntax(tbl)
    for hl_group, hl_value in pairs(tbl) do
        highlight(hl_group, hl_value)
    end
end

--- set properties
--- @param tbl table
local function properties(tbl)
    for property, value in pairs(tbl) do
        vim.o[property] = value
    end
end

--- Set terminal colors
--- @param clrs table
local function terminal(clrs)
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
return function(theme)
    -- vim.defer_fn(function()
    exec("hi clear")
    if vim.fn.exists("syntax_on") then
        exec("syntax reset")
    end

    if config.term_colors then
        terminal(theme.colors)
    end

    properties(theme.properties)

    syntax(theme.hig_groups.base)
    -- vim.defer_fn(function()
    for lang, status in pairs(theme.hig_groups.langs) do
        if type(status) == "table" then
            syntax(theme.hig_groups.langs[lang])
        end
    end

    for plugin, status in pairs(theme.hig_groups.plugins) do
        if type(status) == "table" then
            syntax(theme.hig_groups.plugins[plugin])
        end
    end

    -- vim.defer_fn(function()
    exec("do ColorScheme")
    -- end, 70)
    -- end, 60)
    -- end, 5)
end
