local colors = {
    none = "NONE",
    bg = "#11121D",
    fg = "#A0A8CD",
    orange = "#F6955B",
    yellow = "#D7A65F",
    blue = "#63cdcf",
    yellow = "#D7A65F",
    green = "#95C561",
    red = "#EE6D85",
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
}

colors.groups = {
    styles = {
        string = { fg = colors.yellow },
        field = { fg = colors.orange },
        comment = { fg = colors.white },
    	func = { fg = colors.green },
	},
}

colors.remaps = {
    base = {
        PmenuSel = { fg = colors.inactive, bg = colors.green },
        PmenuThumb = { bg = colors.subtle, fg = "NONE" },
        Pmenu = { fg = colors.fg, bg = colors.bg_alt },
        PmenuSbar = { fg = "NONE", bg = colors.bg_float },
        MatchParen = { bg = colors.highlight },
        Special = { fg = colors.magenta },
    },
    plugins = {
        treesitter = {
            TSPunctBracket = { fg = colors.magenta },
            TSPunctDelimiter = { fg = colors.fg },
            TSFuncBuiltin = { fg = colors.funcbuiltin, italic = false },
            TSKeyword = { fg = colors.red },
            TSType = { fg = colors.magenta },
            TSRepeat = { fg = colors.red },
            TSParameter = { fg = colors.orange },
            TSOperator = { fg = colors.red },
            -- TSConstBuiltin = { fg = colors.yellow },
            -- TSStringSpecial = { fg = colors.blue },
            TSKeywordOperator = { fg = colors.red },
            TSPunctBracket = { fg = colors.fg },
            TSProperty = { fg = colors.orange },
        	TSKeywordFunction = { fg = colors.red },
		},
    },
}

return colors
