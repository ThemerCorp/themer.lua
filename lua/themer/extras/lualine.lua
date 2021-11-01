local config = require("themer.config").options

local ok, lualine = pcall(require, "lualine")

local remaps_lualine = {}
local __lualine = {}

__lualine.remap = function(custom_opts)
    remaps_lualine = vim.tbl_deep_extend("force", remaps_lualine, custom_opts or {})
end

__lualine.get = function(cs)
    if not ok then
        local cs = cs or config.colorscheme
        local cp = require("themer.api.colors").get_color_scheme(cs).color_scheme
        local themer = {}
        themer.normal = {
            a = { bg = cp.orange, fg = cp.bg, gui = "bold" },
            b = { bg = cp.overlay, fg = cp.orange },
            c = { bg = cp.bg, fg = cp.fg },
        }
        themer.insert = {
            a = { bg = cp.green, fg = cp.bg, gui = "bold" },
            b = { bg = cp.overlay, fg = cp.green },
            c = { bg = cp.bg, fg = cp.fg },
        }
        themer.visual = {
            a = { bg = cp.magenta, fg = cp.bg, gui = "bold" },
            b = { bg = cp.overlay, fg = cp.magenta },
            c = { bg = cp.bg, fg = cp.fg },
        }
        themer.replace = {
            a = { bg = cp.blue, fg = cp.bg, gui = "bold" },
            b = { bg = cp.overlay, fg = cp.blue },
            c = { bg = cp.bg, fg = cp.fg },
        }
        themer.command = {
            a = { bg = cp.red, fg = cp.bg, gui = "bold" },
            b = { bg = cp.overlay, fg = cp.red },
            c = { bg = cp.bg, fg = cp.fg },
        }
        themer.inactive = {
            a = { bg = cp.bg, fg = cp.inactive, gui = "bold" },
            b = { bg = cp.bg, fg = cp.inactive },
            c = { bg = cp.bg, fg = cp.inactive },
        }
        if not (next(remaps_lualine) == nil) then
            themer = vim.tbl_deep_extend("force", themer, remaps_lualine)
        end
        return themer
    end
end

return __lualine
