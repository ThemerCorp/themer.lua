---@class nv
local nv = {}

---Convert a lua table into a lua syntactically correct string
---@param tbl table
---@return string table as string
local function table_to_string(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result .. '["' .. k .. '"]' .. "="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result .. table_to_string(v)
        elseif type(v) == "boolean" then
            result = result .. tostring(v)
        else
            result = result .. '"' .. v .. '"'
        end
        result = result .. ","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len() - 1)
    end
    return result .. "}"
end

---Last step before writing to buffer
---@param cp the color palette
---@return table config in conf format
nv.generate_nv_config = function(cp)
    local conf = { "-- Put this in colors/theme_name.lua", "-- Themer Generated NeoVim Theme" }

    table.insert(conf, "local hig = " .. table_to_string(require("themer.modules.core.mapper")(cp)))

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
