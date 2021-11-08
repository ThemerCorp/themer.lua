local colors = {
    none = "NONE",
    bg = "#11121D",
    fg = "#A0A8CD",
    red = "#F6955B",
    -- yellow = "#D7A65F",
    blue = "#95C561",
    green = "#D7A65F",
    yellow = "#95C561",
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

require("themer.color_schemes.config").options = {
    styles = {
        comments = { italic = true, bold = true },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        parameters = {},
        fields = {},
        hint = {},
        info = {},
        warn = {},
        error = {},
        punctuation = {},
        comment = {},
    },
}

require("themer").remap_hl_group({
    -- TSPunctBracket = { fg = colors.red },
    -- TSPunctDelimiter = { fg = colors.delimiter },
    TSFuncBuiltin = { fg = colors.funcbuiltin, italic = false },
    TSKeyword = { fg = colors.orange },
    TSType = { fg = colors.magenta },
    TSRepeat = { fg = colors.orange },
    TSParameter = { fg = colors.red },
    MatchParen = { bg = colors.highlight },
    -- TSOperator = { fg = colors.funcbuiltin },
    -- TSConstBuiltin = { fg = colors.yellow },
    -- TSStringSpecial = { fg = colors.blue },
})
return colors
