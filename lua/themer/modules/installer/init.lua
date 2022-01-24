local M = {}
-- TODO: A way to display installed themes
-- TODO: Check rtp before adding (usually duplicates arent allowed)
-- TODO: Faster and cleaner themes_list retrieval
-- TODO: change prints to vim.notify
-- TODO: a way to unify vim.g variables
-- TODO: a way to acknowldge the real plugin authors and link to og repo

local utils = require("themer.modules.installer.utils")

local themes_list = utils.parse_readme()
local data_path = vim.fn.stdpath("data").."/themer/"

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

M.fuzzy_install = function(opts)
    pickers.new(opts, {
        prompt_title = "Install Themes",
        finder = finders.new_table {
            results = vim.tbl_keys(themes_list)
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local name = action_state.get_selected_entry()[1]
				utils.install(name)
            end)
            return true
        end,
    }):find()
end

M.fuzzy_uninstall = function(opts)
	if #utils.installed_themes() == 0 then
		print("No Themes installed to delete!")
		return
	end

    pickers.new(opts, {
        prompt_title = "Uninstall Theme",
        finder = finders.new_table {
            results = utils.installed_themes()
        },
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

M.load_installed_themes = function()
	for _, dirs in ipairs(vim.fn.readdir(data_path)) do
		vim.opt.rtp:append(data_path..dirs)
	end
end

return M
