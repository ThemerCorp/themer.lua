local json_utils = {}

-- for some 0.6 exclusive features :P
json_utils.is_minimum_version = function(major, minor, patch)
	local version = vim.version()
	return major <= version.major and minor <= version.minor and patch <= version.patch
end

json_utils.get_cfd = function()
	local cfd = string.sub(debug.getinfo(1, "S").source, 2):match("(.*/)")
	return cfd
end

json_utils.encode_decode = function()
	local json = {}
	json.encode = json_utils.is_minimum_version(0, 6, 0) and vim.json.encode or vim.fn.json_encode()
	json.decode = json_utils.is_minimum_version(0, 6, 0) and vim.json.decode or vim.fn.json_decode()
	return json
end

---path relative to this file lol
---@param path string
json_utils.decode = function(path)
	local json_content = json_utils.encode_decode().decode(
		table.concat(vim.fn.readfile(table.concat({ json_utils.get_cfd(), path })))
	)
	return json_content
end

return json_utils
