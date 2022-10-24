local str = {}

--- Split strings
--- @param inputstr string string to split
--- @param sep string separator
--- @return string
str.split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

--- Do deep recursion and replace given string in nested table
--- @param table table table to perform deep recursion upon
--- @param search_for string string to look for
--- @param replacement string string to replace to
str.deep_replace = function(table, search_for, replacement)
    if not table then return end

    for key, value in pairs(table) do
        if type(value) == "table" then
            str.deep_replace(value, search_for, replacement)
        else
            table[key] = value:gsub(search_for, replacement)
        end
    end
end

return str
