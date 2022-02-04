local c = {} ---Stores the colorscheme

---@class nv
local nv = {}

--- highlight using :highlight
--- @param group string
--- @param color table
local function highlight(group, color)
  local parts = { group }
  parts[#parts + 1] = color.fg and "guifg=" .. color.fg or nil
  parts[#parts + 1] = color.bg and "guibg=" .. color.bg or nil
  parts[#parts + 1] = color.sp and "guisp=" .. color.sp or nil
  parts[#parts + 1] = color.style and "gui=" .. color.style or nil
  if #parts == 1 and color.link then
    table.insert(c, "highlight! link " .. group .. " " .. color.link)
  elseif #parts ~= 1 then
    table.insert(c, "highlight " .. table.concat(parts, " "))
  end
end

--- Highlight on basis of given group and color
--- @param tbl table
local function syntax(tbl)
  for hl_group, hl_value in pairs(tbl) do
    highlight(hl_group, hl_value)
  end
end

---Last step before writing to buffer
---@param cp the color palette
---@return table conlorscheme
nv.generate_nv_colorscheme = function(cp)
  local theme = require("themer.modules.core.mapper")(cp)
  table.insert(c, "set termguicolors")
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

  table.insert(c, "doautocmd ColorScheme")
  return c
end

---Writes colorscheme to a buffer
---@param cp the color palette
---@return nil
nv.write_colorscheme = function(cp)
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(buf, "Compiled NeoVim Theme")
  vim.api.nvim_buf_set_lines(buf, 0, 1, true, nv.generate_nv_colorscheme(cp))
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "readonly", true)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "filetype", "vim")
  vim.api.nvim_exec("buffer " .. buf, false)
end

return nv
