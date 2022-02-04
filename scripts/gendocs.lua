local docgen = require("docgen")

local docs = {}

docs.test = function()
    -- TODO: Fix the other files so that we can add them here.
    local input_files = {
        "./lua/themer/init.lua",
        "./lua/themer/config.lua",
        "./lua/themer/modules/import/init.lua",
        "./lua/themer/modules/export/nvim.lua",
        "./lua/themer/modules/export/vim.lua",
        "./lua/themer/modules/export/xres.lua",
        "./lua/themer/modules/export/kitty.lua",
        "./lua/themer/modules/export/alacritty.lua",
        "./lua/themer/modules/core/api.lua",
        "./lua/themer/modules/core/init.lua",
    }

    local output_file = "./doc/themer.txt"
    local output_file_handle = io.open(output_file, "w")

    for _, input_file in ipairs(input_files) do
        docgen.write(input_file, output_file_handle)
    end

    output_file_handle:write(" vim:tw=78:ts=8:ft=help:norl:\n")
    output_file_handle:close()
    vim.cmd([[checktime]])
end

docs.test()

return docs
