local concat = function(t, r)
     r = r or {}
     for k,v in pairs(t)  do
         if type(v)=="table" then
            r[#r+1] = string.format('\t["%s"]={\n',k  )
            concat(v, r)
            r[#r+1] = "\t},\n"
         else
            r[#r+1] = string.format('\t\t["%s"]=%03s,\n',k ,v )
         end
     end
     return r
end

--- Do deep recursion and replace given string in nested table
--- @param table table table to perform deep recursion upon
--- @param search_for string string to look for
--- @param replacement string string to replace to
local deep_replace = function(table, search_for, replacement)
    if not table then return end

    for key, value in pairs(table) do
        if type(value) == "table" then
            deep_replace(value, search_for, replacement)
        else
            table[key] = value:gsub(search_for, replacement)
        end
    end
end

local scandir = function(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

for _, theme in ipairs(scandir("../lua/themer/modules/themes")) do
--- read
local handle = io.open(theme,'rb')
local data  = handle:read("*a")
handle:close()

local t = loadstring(data)()

-- edit
deep_replace(t, "#0", t.fg)

-- write
local r = concat(t)
local text = "return { \n " .. table.concat(r) .. "}"
print(text) -- just control

--local handle = io.open(theme,'wb')
--local data  = handle:write(text)
--handle:close()

end
