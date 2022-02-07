local fs = {}

--- Check if a file or directory exists in this path
---@param file string path of file or directory
fs.exists = function(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

return fs
