--- @class main
local main = {}

-- useful aliases
local utils = require("themer.utils.util")
local config = require("themer.config").options

--- @param cs string colorscheme name
function main.load_colorscheme(cs)
    vim.g.colors_name = cs or config.colorscheme

    local api = require("themer.api.colors").get_color_scheme(cs or config.colorscheme)
    if not api.status then
        vim.api.nvim_err_writeln(api.msg)
    end
    local theme = require("themer.core.mapper").apply(api.color_scheme)
    -- Support for galaxyline and lualine
    if config.extra_integrations.galaxyline then
        require("themer.extras.galaxyline").get(cs, theme)
    end

    utils.load(theme)
end

return main
