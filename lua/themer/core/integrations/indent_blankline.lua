local hig = {}

function hig.get(cp)
    local hi = {
        IndentBlanklineChar = { fg = cp.gray, nocombine = true },
    }

    if require("themer.config").options.integrations.indent_blankline.colored_indent_levels then
        hi["IndentBlanklineIndent6"] = { nocombine = true, fg = cp.yellow }
        hi["IndentBlanklineIndent5"] = { nocombine = true, fg = cp.red }
        hi["IndentBlanklineIndent4"] = { nocombine = true, fg = cp.green }
        hi["IndentBlanklineIndent3"] = { nocombine = true, fg = cp.orange }
        hi["IndentBlanklineIndent2"] = { nocombine = true, fg = cp.blue }
        hi["IndentBlanklineIndent1"] = { nocombine = true, fg = cp.magenta }

        -- Configuring indent_blankline to set colored levels
        local present, indent = pcall(require, "indent_blankline")
        if present then
          indent.setup({
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                "IndentBlanklineIndent4",
                "IndentBlanklineIndent5",
                "IndentBlanklineIndent6",
            },
        })
        end
    end

    return hi
end

return hig
