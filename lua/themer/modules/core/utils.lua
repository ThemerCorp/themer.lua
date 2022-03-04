local utils = {}

local g = vim.g
local config = require("themer.config")("get")
local exec = vim.api.nvim_command

--- highlight using :highlight
--- @param group string
--- @param val table
utils.highlight = function(group, val)
  val.fg = val.fg == "#0" and "NONE" or val.fg
  val.bg = val.bg == "#0" and "NONE" or val.bg
  vim.api.nvim_set_hl(0, group, val)
end

--- Highlight on basis of given group and color
--- @param tbl table
local function syntax(tbl)
  for hl_group, hl_value in pairs(tbl) do
    utils.highlight(hl_group, hl_value)
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
  g.terminal_color_0 = clrs.bg.base
  g.terminal_color_1 = clrs.red
  g.terminal_color_2 = clrs.green
  g.terminal_color_3 = clrs.yellow
  g.terminal_color_4 = clrs.blue
  g.terminal_color_5 = clrs.magenta
  g.terminal_color_6 = clrs.cyan
  g.terminal_color_7 = clrs.fg

  g.terminal_color_8 = clrs.bg.base
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
utils.load_mapper_higs = function(theme, cs)
  exec("hi clear")
  if vim.fn.exists("syntax_on") then
    exec("syntax reset")
  end

  if config.term_colors then
    terminal(theme.colors)
  end

  properties(theme.properties)

  syntax(theme.hig_groups.themer)
  syntax(theme.hig_groups.base)

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

  vim.cmd([[doautocmd ColorScheme]])

  vim.g.colors_name = cs
end

return utils
