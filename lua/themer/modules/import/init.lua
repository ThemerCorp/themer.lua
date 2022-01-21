local import = {}

---Returns hex color of the value of the hig group
---@param hl_name string hig group name
---@param value string foreground/background
---@return string hex value
local color_from_hl = function(hl_name, value)
    local hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    local color = string.format("#%x", hl[value] or 0)
    return color
end

local generate_cp = function()
        local cp = {
            red = vim.g.terminaL_color_1,
            yellow = vim.g.terminal_color_3,
            orange = vim.g.terminal_color_11,
            magenta = vim.g.terminal_color_5,
            blue = vim.g.terminal_color_4,
            green = vim.g.terminal_color_2,
            cyan = vim.g.terminal_color_6,

            fg = color_from_hl("Normal", "foreground"),
            diff = {
                add = color_from_hl("DiffAdd", "background"),
                remove = color_from_hl("DiffDelete", "background"),
                change = color_from_hl("DiffChange", "background"),
                text = color_from_hl("DiffText", "background"),
            },
            accent = color_from_hl("Special", "foreground"),
            search_result = {
                fg = color_from_hl("Search", "foreground"),
                telescope = color_from_hl("TelescopeMatching", "foreground"),
                bg = color_from_hl("Search", "background"),
            },
            cursorlinenr = color_from_hl("CursorLineNr", "foreground"),
            match = color_from_hl("CmpItemAbbrMatch", "foreground"),
            dimmed = {
                inactive = color_from_hl("NonText", "foreground"),
                subtle = color_from_hl("StatuslineNC", "foreground"),
            },
            bg = {
                base = color_from_hl("Normal", "background"),
                alt = color_from_hl("NormalFloat", "background"),
                selected = color_from_hl("CursorLine", "background"),
            },
            border = color_from_hl("FloatBorder", "foreground"),
            syntax = {
            statement = color_from_hl("Statement", "foreground"),
            ["function"] = color_from_hl("TSFunction", "foreground"),
            variable = color_from_hl("TSVariable", "foreground"),
            include = color_from_hl("Include", "foreground"),
            keyword = color_from_hl("TSKeyword", "foreground"),
            struct = color_from_hl("Structure", "foreground"),
            string = color_from_hl("TSString", "foreground"),
            field = color_from_hl("TSField", "foreground"),
            parameter = color_from_hl("TSParameter", "foreground"),
            property = color_from_hl("TSProperty", "foreground"),
            punctuation = color_from_hl("TSPunctBracket", "foreground"),
            constructor = color_from_hl("TSConstructor", "foreground"),
            operator = color_from_hl("TSOperator", "foreground"),
            preproc = color_from_hl("PreProc", "foreground"),
            constant = color_from_hl("TSConstant", "foreground"),
            todo = { fg = color_from_hl("Todo", "foreground"), bg = color_from_hl("Todo", "background") },
            number = color_from_hl("Number", "foreground"),
            comment = color_from_hl("TSComment", "foreground"),
            type = color_from_hl("TSType", "foreground"),
            conditional = color_from_hl("TSConditional", "foreground"),
            },
        built_in = {
            ["function"] = color_from_hl("TSFuncBuiltin", "foreground"),
            type = color_from_hl("TSTypeBuiltin", "foreground"),
            variable = color_from_hl("TSVariableBuiltin", "foreground"),
            keyword = color_from_hl("TSKeywordFunction", "foreground"),
            constant = color_from_hl("TSConstBuiltin", "foreground"),
        },
        diagnostic = {
            error = color_from_hl("DiagnosticError", "foreground"),
            warn = color_from_hl("DiagnosticWarn", "foreground"),
            info = color_from_hl("DiagnosticInfo", "foreground"),
            hint = color_from_hl("DiagnosticHint", "foreground"),
        },
        inc_search = { bg = color_from_hl("IncSearch", "background"), fg = color_from_hl("IncSearch", "foreground") },
        uri = color_from_hl("TSURI", "foreground"),
        pum = {
            fg = color_from_hl("Pmenu", "foreground"),
            bg = color_from_hl("Pmenu", "background"),
            sbar = color_from_hl("PmenuSbar", "background"),
            thumb = color_from_hl("PmenuThumb", "background"),
            sel = {
                bg = color_from_hl("PmenuSel", "background"),
                fg = color_from_hl("PmenuSel", "foreground"),
            },
        },
        heading = {
            h1 = color_from_hl("htmlH1", "foreground"),
            h2 = color_from_hl("htmlH2", "background"),
        },
    }

    return cp
end

import.write_colorscheme = function()
    vim.pretty_print(generate_cp())
end

return import
