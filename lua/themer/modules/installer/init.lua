local M = {}
local telescope = {}

-- TODO: a way to unify vim.g variables
-- TODO: a way to acknowldge the real plugin authors and link to og repo

local utils = require("themer.modules.installer.utils")
local data_path = vim.fn.stdpath("data") .. "/themer/"

telescope.pickers = require("telescope.pickers")
telescope.finders = require("telescope.finders")
telescope.conf = require("telescope.config").values
telescope.actions = require("telescope.actions")
telescope.action_state = require("telescope.actions.state")

M.fuzzy_install = function(opts)
    local themes_list = utils.parse_readme()
    telescope.pickers.new(opts, {
        prompt_title = "Install Themes",
        finder = telescope.finders.new_table({
            results = vim.tbl_keys(themes_list),
        }),
        sorter = telescope.conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _map)
            telescope.actions.select_default:replace(function()
                telescope.actions.close(prompt_bufnr)
                local theme = telescope.action_state.get_selected_entry()[1]
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

    telescope.pickers.new(opts, {
        prompt_title = "Uninstall Theme",
        finder = telescope.finders.new_table({
            results = utils.installed_themes(),
        }),
        sorter = telescope.conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _map)
            telescope.actions.select_default:replace(function()
                telescope.actions.close(prompt_bufnr)
                local name = telescope.action_state.get_selected_entry()[1]
                utils.uninstall(name)
            end)
            return true
        end,
    }):find()
end

M.load_installed_themes = function()
    for _, dirs in ipairs(vim.fn.readdir(data_path)) do
        vim.opt.rtp:append(data_path .. dirs)
    end
end

return M
