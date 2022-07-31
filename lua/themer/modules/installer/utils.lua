local M = {}
local data_path = vim.fn.stdpath("data") .. "/themer/"

-- NOTE: temp solution
M.parse_readme = function()
  local path =
    debug.getinfo(1, "S").source:sub(2):gsub("lua/themer/modules/installer/utils.lua", "python/json/color_schemes.json")

  local file = table.concat(vim.fn.readfile(path))
  local decoded = vim.json.decode(file)
  return decoded
end

M.noice = function()
  return require("themer.modules.installer.color_schemes")
end

M.install = function(theme)
  assert(theme)
  if vim.tbl_contains(M.installed_themes(), theme) then
    print("Theme already installed!")
    return
  end

  local git_url = M.parse_readme()[theme]
  local theme_name = theme:match(".*/(.*)")
  vim.fn.mkdir(data_path, "p")

  local destination_path = data_path .. theme_name

  vim.notify("Installing " .. theme, "info")
  vim.fn.jobstart({ "git", "clone", git_url, destination_path, "--depth", "1" }, {
    cwd = ".",
    on_exit = function()
      vim.notify(theme .. " Installed!", "info")
    end,
  })

  vim.opt.rtp:append(destination_path)
end

M.uninstall = function(theme)
  local dest = data_path .. theme
  if vim.fn.isdirectory(dest) == 0 then
    vim.notify("No such theme!", "error")
  else
    vim.fn.delete(dest, "rf")
    vim.notify("Theme " .. theme .. " uninstalled!")
  end
end

M.installed_themes = function()
  return vim.fn.readdir(data_path)
end

return M
