local M = {}
local data_path = vim.fn.stdpath("data").."/themer/"
M.cache = {}

-- M.parse_readme = function()
	-- local themes = {}
	-- -- for pack in pairs(package.loaded) do if pack:match("^themer") then package.loaded[pack] = nil end end
	-- local body = io.input("./temp.md"):read('a')
	-- -- local body = require("plenary.curl").get("https://raw.githubusercontent.com/rockerBOO/awesome-neovim/main/README.md")

	-- for line in body:match("### Colorscheme\n(.+)#### Lua Colorscheme"):gmatch("([^\n]*)\n?") do
		-- local repo = line:match("- %[([^%[]*)%]%(.*%) -")

		-- if repo ~= nil then
			-- -- local username = repo:match("(.*)/")
			-- local reponame = repo:match("/(.*)")
			-- if reponame ~= nil then
				-- themes[reponame] = repo
			-- end
		-- end
	-- end

	-- M.cache = themes
	-- return themes
-- end

-- NOTE: temp solution
M.parse_readme = function()
	return require("themer.modules.installer.color_schemes")
end

M.install = function(theme_name)
	assert(theme_name)
	if vim.tbl_contains(M.installed_themes(), theme_name) then
		print("Theme already installed!")
		return
	end

	if #vim.tbl_keys(M.cache) == 0 then M.cache = M.parse_readme() end
    local git_path = "https://github.com/"..(M.cache[theme_name])..".git"
    vim.fn.mkdir(data_path, "p")

    local destination_path = data_path..theme_name

	print("Installing "..theme_name)
	vim.fn.jobstart({"git", "clone", git_path, destination_path, "--depth", "1"}, {
		cwd = ".",
		on_exit = function()
			print(theme_name.." Installed!")
		end
	})

    vim.opt.rtp:append(destination_path)
end

M.uninstall = function(theme_name)
	local dest = data_path..theme_name
	if vim.fn.isdirectory(dest) == 0 then
		print("No such theme!")
	else
		vim.fn.delete(dest, "rf")
		print("Theme "..theme_name.." deleted!")
	end
end

M.installed_themes = function()
	return vim.fn.readdir(data_path)
end

return M
