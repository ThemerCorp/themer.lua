---@class nv
local nv = {}

---Last step before writing to buffer
---@param cp the color palette
---@return table config in conf format
nv.generate_nv_config = function(cp)
    local conf = { "-- Put this in colors/theme_name.lua", "-- Themer Generated NeoVim Theme" }

    local hig = require("themer.core.mapper")(cp)

    table.insert(conf, "local theme = {")

    for typeName, typeContent in pairs(hig) do
        table.insert(conf, string.format("['%s'] = {", typeName))
        if typeName == "colors" then
            for colors, hex in pairs(typeContent) do
                -- recursions
                if type(hex) == "table" then
                    table.insert(conf, string.format("['%s'] = {", colors))
                    for colors1, hex1 in pairs(hex) do
                        if type(hex1) == "table" then
                            table.insert(conf, string.format("['%s'] = {", colors1))
                            for colors2, hex2 in pairs(hex1) do
                                table.insert(conf, string.format("['%s'] = '%s',", colors2, hex2))
                            end
                            table.insert(conf, "},")
                        else
                            table.insert(conf, string.format("['%s'] = '%s',", colors1, hex1))
                        end
                    end
                    table.insert(conf, "},")
                else
                    table.insert(conf, string.format("['%s'] = '%s',", colors, hex))
                end
            end
        elseif typeName == "hig_groups" then
            for grpName, grpVal in pairs(typeContent) do
                table.insert(conf, string.format("%s = {", grpName))
                if grpName == "base" or grpName == "themer" then
                    -- recursions 2.0
                    for bgrName, bgrVal in pairs(grpVal) do
                        table.insert(conf, string.format("['%s'] = {", bgrName))
                        for val, valHex in pairs(bgrVal) do
                            table.insert(conf, string.format("%s = '%s',", val, valHex))
                        end
                        table.insert(conf, "},")
                    end
                else
                    for plName, plVal in pairs(grpVal) do
                        if type(plVal) == "table" then
                            -- recursions 3.0
                            for bgrName, bgrVal in pairs(plVal) do
                                table.insert(conf, string.format("['%s'] = {", bgrName))
                                for val, valHex in pairs(bgrVal) do
                                    table.insert(conf, string.format("%s = '%s',", val, valHex))
                                end
                                table.insert(conf, "},")
                            end
                        end
                    end
                end
                table.insert(conf, "},")
            end
        end
        table.insert(conf, "},")
    end

    table.insert(conf, "}")

    -- highlight function
    table.insert(conf, "local g, exec = vim.g, vim.cmd")
    table.insert(conf, [[local function highlight(group, color) local parts = {group}]])
    table.insert(conf, [[parts[#parts + 1] = color.fg and "guifg=" .. color.fg or nil]])
    table.insert(conf, [[parts[#parts + 1] = color.bg and "guibg=" .. color.bg or nil]])
    table.insert(conf, [[parts[#parts + 1] = color.sp and "guisp=" .. color.sp or nil]])
    table.insert(conf, [[parts[#parts + 1] = color.style and "gui=" .. color.style or nil]])
    table.insert(
        conf,
        [[if #parts==1 and color.link then exec("hi! link " .. group .. " " .. color.link) elseif #parts ~= 1 then exec("hi " .. table.concat(parts, " ")) end end]]
    )

    -- recursive highlight function
    table.insert(
        conf,
        [[local function syntax(tbl)for hl_group, hl_value in pairs(tbl) do highlight(hl_group, hl_value) end end]]
    )

    -- load colorscheme
    table.insert(conf, [[exec("hi clear")]])
    table.insert(conf, [[if vim.fn.exists("syntax_on") then exec("syntax reset") end]])
    table.insert(
        conf,
        [[for lang, status in pairs(theme.hig_groups.langs) do if type(status) == "table" then syntax(theme.hig_groups.langs[lang]) end end]]
    )
    table.insert(
        conf,
        [[for plugin, status in pairs(theme.hig_groups.plugins) do if type(status) == "table" then syntax(theme.hig_groups.plugins[plugin]) end end]]
    )
    table.insert(conf, [[syntax(theme.hig_groups.themer)]])
    table.insert(conf, [[syntax(theme.hig_groups.base)]])
    table.insert(conf, [[exec("do ColorScheme")]])
    return conf
end

---Writes config to a buffer
---@param cp the color palette
---@return nil
nv.write_config = function(cp)
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "NeoVim Theme")
    vim.api.nvim_buf_set_lines(buf, 0, 1, true, nv.generate_nv_config(cp))
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "readonly", true)
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "filetype", "lua")
    vim.api.nvim_exec("buffer " .. buf, false)
end

return nv
