local M = {}
-- TODO: a way to unify vim.g variables
-- TODO: a way to acknowldge the real plugin authors and link to og repo

local utils = require("themer.modules.installer.utils")
local data_path = vim.fn.stdpath("data") .. "/themer/"

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

M.fuzzy_install = function(opts)
  local themes_list = utils.parse_readme()
  pickers.new(opts, {
    prompt_title = "Install Themes",
    finder = finders.new_table({
      results = vim.tbl_keys(themes_list),
    }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local theme = action_state.get_selected_entry()[1]
        utils.install(theme)
      end)
      return true
    end,
  }):find()
end

M.fuzzy_uninstall = function(opts)
  if #utils.installed_themes() == 0 then
    vim.notify("No Themes installed to delete!", "warn")
    return
  end

  pickers.new(opts, {
    prompt_title = "Uninstall Theme",
    finder = finders.new_table({
      results = utils.installed_themes(),
    }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local name = action_state.get_selected_entry()[1]
        utils.uninstall(name)
      end)
      return true
    end,
  }):find()
end

return M
