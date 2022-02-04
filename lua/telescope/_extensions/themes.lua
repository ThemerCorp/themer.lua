---@deps plenary
local scan = require("plenary.scandir")

local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  vim.notify("Themer: The themes picker needs nvim-telescope/telescope.nvim", vim.log.levels.ERROR)
end
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")

local function get_theme()
  -- local themes = {}
  -- local theme_dir = debug.getinfo(2, "S").source:sub(2)
  -- theme_dir = theme_dir:gsub("lua/telescope/_extensions/themes.lua", "")
  -- theme_dir = theme_dir .. "lua/themer/modules/themes"

  -- local fd = scan.scan_dir(theme_dir)

  -- if fd then
  --     for _, file in ipairs(fd) do
  --         if string.find(file, "lua") then
  --             local theme = file:gsub(theme_dir .. ".", ""):gsub(".lua", "")
  --             local disable_themes = require("themer.config")("get").disable_telescope_themes
  --             if not vim.tbl_contains(disable_themes, theme) then
  --                 table.insert(themes, theme)
  --             end
  --         end
  --     end
  -- end
  local themes = vim.fn.getcompletion("themer_", "color")

  for i = 1, #themes do
    themes[i] = themes[i]:gsub("themer_", "")
  end

  return themes
end

local function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  require("themer").setup({ colorscheme = selected[1] })
  local colorscheme = string.format([[require("themer").setup({colorscheme = %s})]], selected[1])
  vim.fn.jobstart(colorscheme)
  actions.close(prompt_bufnr)
end

local function next_color(prompt_bufnr)
  actions.move_selection_next(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  require("themer").setup({ colorscheme = selection[1] })
end

local function prev_color(prompt_bufnr)
  actions.move_selection_previous(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  require("themer").setup({ colorscheme = selection[1] })
end

local function preview(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  require("themer.modules.core")(selection[1])
end

local function themer(opts)
  local colors = get_theme()
  local opts = require("telescope.themes").get_dropdown({
    prompt_title = "Themer ColorScheme",
    results_title = "Change colorscheme",
    finder = finders.new_table({
      results = colors,
    }),
    previewer = false,
    attach_mappings = function(prompt_bufnr, map)
      for type, value in pairs(require("themer.config")("get").telescope_mappings) do
        for bind, method in pairs(value) do
          map(type, bind, function()
            if method == "enter" then
              enter(prompt_bufnr)
            elseif method == "next_color" then
              next_color(prompt_bufnr)
            elseif method == "prev_color" then
              prev_color(prompt_bufnr)
            elseif method == "preview" then
              preview(prompt_bufnr)
            end
          end)
        end
      end
      return true
    end,
    sorter = require("telescope.config").values.generic_sorter({}),
  })
  local colorschemes = pickers.new(opts)
  colorschemes:find()
end

return telescope.register_extension({
  exports = {
    themes = themer,
  },
})
