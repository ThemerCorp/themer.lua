-- Get path to json.lua
local relative = require("themer.utils.json").get_cfd()

-- add wildcard to themes to path
relative = table.concat({ relative, "../../../colors/*.lua" })

-- expand wildcards; get all themes' pathes
local themes = vim.fn.expand(relative)

-- remove wildcard from our path to theme folder
relative = relative:gsub("*.lua", "")

-- leave only themename.lua\n
themes = themes:gsub(relative, "")

-- leave only themename\n
themes = themes:gsub(".lua", "")

-- remove random from themes
themes = themes:gsub("random\n", "")

-- split strings and create table
local function split_table(s, delimiter)
    local result = {}
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

-- create themes table
themes = split_table(themes, "\n")

-- random stuff
math.randomseed(os.clock())
local index = math.floor(math.random() * #themes) + 1

-- load theme
require("themer").load(themes[index])
