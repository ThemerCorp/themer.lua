local reload = {}

reload.load_au = function()
    vim.cmd([[
    augroup themer_reload
      autocmd!
      autocmd InsertLeave * lua require("themer.modules.reload").load_color_palette()
    augroup END
  ]])
end

reload.load_color_palette = function()
    local ok, cp = pcall(loadstring, table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false)))
    if ok then
        local default_cp = {
            ["border"] = "#0",
            ["uri"] = "#80a0ff",
            ["dimmed"] = { ["subtle"] = "#0", ["inactive"] = "#ff" },
            ["match"] = "#0",
            ["search_result"] = { ["bg"] = "#ffff00", ["telescope"] = "#0", ["fg"] = "#0" },
            ["accent"] = "#ffa500",
            ["pum"] = {
                ["thumb"] = "#ffffff",
                ["sbar"] = "#808080",
                ["sel"] = { ["bg"] = "#a9a9a9", ["fg"] = "#0" },
                ["bg"] = "#ff00ff",
                ["fg"] = "#0",
            },
            ["fg"] = "#0",
            ["heading"] = { ["h1"] = "#0", ["h2"] = "#0" },
            ["inc_search"] = { ["bg"] = "#0", ["fg"] = "#0" },
            ["orange"] = "#C0A36E",
            ["diagnostic"] = {
                ["hint"] = "#d3d3d3",
                ["error"] = "#ff0000",
                ["info"] = "#add8e6",
                ["warn"] = "#ffa500",
            },
            ["bg"] = { ["base"] = "#0", ["selected"] = "#666666", ["alt"] = "#ff00ff" },
            ["diff"] = { ["change"] = "#8b008b", ["add"] = "#8b", ["remove"] = "#8b8b", ["text"] = "#ff0000" },
            ["green"] = "#76946A",
            ["built_in"] = {
                ["constant"] = "#ffa500",
                ["function"] = "#ffa500",
                ["type"] = "#60ff60",
                ["keyword"] = "#ffff60",
                ["variable"] = "#ffa500",
            },
            ["blue"] = "#7E9CD8",
            ["syntax"] = {
                ["character"] = "#ffa0a0",
                ["string"] = "#ffa0a0",
                ["property"] = "#40ffff",
                ["conditional"] = "#ffff60",
                ["statement"] = "#ffff60",
                ["todo"] = { ["bg"] = "#ffff00", ["fg"] = "#ff" },
                ["punctuation"] = "#ffa500",
                ["number"] = "#ffa0a0",
                ["struct"] = "#60ff60",
                ["tag"] = "#ffff60",
                ["field"] = "#40ffff",
                ["function"] = "#40ffff",
                ["keyword"] = "#ffff60",
                ["type"] = "#60ff60",
                ["constant"] = "#ffa0a0",
                ["parameter"] = "#40ffff",
                ["operator"] = "#ffff60",
                ["preproc"] = "#ff80ff",
                ["variable"] = "#0",
                ["constructor"] = "#ffa500",
                ["comment"] = "#80a0ff",
                ["include"] = "#ff80ff",
            },
            ["magenta"] = "#957FB8",
            ["cursorlinenr"] = "#ffff00",
            ["yellow"] = "#C0A36E",
            ["cyan"] = "#6A9589",
        }
        cp = vim.tbl_deep_extend("force", default_cp, cp())
        local theme = require("themer.modules.core.mapper")(cp, "reload_colorscheme")
        require("themer.modules.core.utils")(theme, "reload_colorscheme")
    end
end

return reload
