local json_utils = {}

-- https://stackoverflow.com/a/31857671
local open = io.open

json_utils.readfile = function(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

json_utils.decode = function(path)
	local json_content = json_utils.readfile(path)
	return vim.json.decode(json_content)
end

return json_utils
