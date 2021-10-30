local return_value = require("themer.api.colors").get_color_scheme(require("themer.config").options["colorscheme"])

if not return_value.status then
    vim.api.nvim_err_writeln(return_value.msg)
end

local cp = return_value.color_scheme
local themer = {}

themer.normal = {
    a = { bg = cp.blue, fg = cp.black },
    b = { bg = cp.fg_gutter, fg = cp.blue },
    c = { bg = cp.bg_statusline, fg = cp.fg_sidebar },
}

themer.insert = {
    a = { bg = cp.green, fg = cp.black },
    b = { bg = cp.fg_gutter, fg = cp.green },
}

themer.command = {
    a = { bg = cp.orange, fg = cp.black },
    b = { bg = cp.fg_gutter, fg = cp.orange },
}

themer.visual = {
    a = { bg = cp.magenta, fg = cp.black },
    b = { bg = cp.fg_gutter, fg = cp.magenta },
}

themer.replace = {
    a = { bg = cp.red_br, fg = cp.black },
    b = { bg = cp.fg_gutter, fg = cp.red_br },
}

themer.inactive = {
    a = { bg = cp.bg_alt, fg = cp.blue },
    b = { bg = cp.bg_alt, fg = cp.fg_gutter, gui = "bold" },
    c = { bg = cp.bg_alt, fg = cp.fg_gutter },
}

return themer
