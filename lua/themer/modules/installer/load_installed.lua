local M = {}

local data_path = vim.fn.stdpath("data") .. "/themer/"

M.load_installed_themes = function()
  for _, dirs in ipairs(vim.fn.readdir(data_path)) do
    vim.opt.rtp:append(data_path .. dirs)
  end
end

return M
