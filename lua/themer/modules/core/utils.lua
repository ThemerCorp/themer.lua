local utils = {}

local g = vim.g
local config = require("themer.config")("get")
local exec = vim.api.nvim_command

---Convert table to string
---@param tbl table
local function table_to_str(tbl)
  local result = "{"
  for k, v in pairs(tbl) do
    -- Check the key type (ignore any numerical keys - assume its an array)
    if type(k) == "string" then
      result = result .. '[\\"' .. k .. '\\"]' .. "="
    end

    -- Check the value type
    if type(v) == "table" then
      result = result .. table_to_str(v)
    elseif type(v) == "boolean" then
      result = result .. tostring(v)
    else
      result = result .. '"' .. v .. '"'
    end
    result = result .. ","
  end
  -- Remove leading commas from the result
  if result ~= "" then
    result = result:sub(1, result:len() - 1)
  end
  return result .. "}"
end

--- highlight using :highlight
--- @param group string
--- @param color table
utils.highlight_legacy = function(group, color)
  local parts = { group }
  parts[#parts + 1] = color.fg and "guifg=" .. color.fg or nil
  parts[#parts + 1] = color.bg and "guibg=" .. color.bg or nil
  parts[#parts + 1] = color.sp and "guisp=" .. color.sp or nil
  parts[#parts + 1] = color.style and "gui=" .. color.style or nil
  if #parts == 1 and color.link then
    exec("highlight! link " .. group .. " " .. color.link)
  elseif #parts ~= 1 then
    exec("highlight " .. table.concat(parts, " "))
  end
end

--- Highlight on basis of given group and color
--- @param tbl table
local function syntax(tbl)
  for hl_group, hl_value in pairs(tbl) do
    utils.highlight_legacy(hl_group, hl_value)
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

---Load user and cp remaps hig groups
---@param cp_remaps table color palette remaps
---@param cfg_remaps table config remaps
---@param cs string colorscheme name
utils.load_user_higs = function(cp_remaps, cfg_remaps, cs)
  if not (next(cp_remaps or {}) == nil) then
    syntax(cp_remaps)
  end

  if not (next(cfg_remaps.globals or {}) == nil) then
    syntax(cfg_remaps.globals)
  end

  if not (next(cfg_remaps[cs] or {}) == nil) then
    syntax(cfg_remaps[cs])
  end
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

  utils.load_user_higs(theme.colors.remaps or {}, config.remaps.highlights or {}, cs)

  exec("do ColorScheme")

  vim.g.colors_name = cs
end

return utils
