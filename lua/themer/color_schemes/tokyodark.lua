local colors = {
    none = "NONE",
    bg = "#11121D",
    fg = "#A0A8CD",
    red = "#F6955B",
    -- yellow = "#D7A65F",
    blue = "#95C561",
    yellow = "#D7A65F",
    green = "#95C561",
    orange = "#EE6D85",
    white = "#4A5057",
    magenta = "#A485DD",
    bg_float = "#06080A",
    -- funcbuiltin = "#63cdcf",
    funcbuiltin = "#A485DD",
    highlight = "#1a1b2a",
    highlight_overlay = "#1a1b2a",
    highlight_inactive = "#1a1b2a",
    inactive = "#393b44",
    subtle = "#526175",
    delimiter = "#58cd8b",
}

colors.groups = {
    styles = {
        string = { fg = colors.yellow },
    },
}

colors.remaps = {
    base = {
        PmenuSel = { fg = colors.inactive, bg = colors.green },
        PmenuThumb = { bg = colors.subtle, fg = "NONE" },
        Pmenu = { fg = colors.fg, bg = colors.bg_alt },
        PmenuSbar = { fg = "NONE", bg = colors.bg_float },
        MatchParen = { bg = colors.highlight },
    },
    plugins = {
        treesitter = {
            -- TSPunctBracket = { fg = colors.red },
            -- TSPunctDelimiter = { fg = colors.delimiter },
            TSFuncBuiltin = { fg = colors.funcbuiltin, italic = false },
            TSKeyword = { fg = colors.orange },
            TSType = { fg = colors.magenta },
            TSRepeat = { fg = colors.orange },
            TSParameter = { fg = colors.red },
            -- TSOperator = { fg = colors.funcbuiltin },
            -- TSConstBuiltin = { fg = colors.yellow },
            -- TSStringSpecial = { fg = colors.blue },
            TSKeywordOperator = { fg = colors.orange },
            TSPunctBracket = { fg = colors.fg },
        },
    },
}

return colors
