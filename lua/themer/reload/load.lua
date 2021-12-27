local currentFileTail = vim.fn.expand("%:t"):gsub(".lua", "")
local currentFilePath = vim.fn.expand("%"):gsub(".lua", "")

local load = function()
    local ok, colorscheme = pcall(require, currentFilePath)
    if ok then
        print("ok")
        -- bear with me for too many pcalls
        pcall(require("themer.utils"), pcall(require("themer.core.mapper"), colorscheme, currentFileTail))
        print("done")
    end
end

return load
