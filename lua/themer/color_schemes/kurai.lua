local colors = {
    flavour = "dark",
    bg = "#1a1a1a",
    bg_alt = "#1f1f1f",
    bg_float = "#141414",
    inactive = "#393b44",
    subtle = "#526175",
    fg = "#d2c1e6",
    red = "#f76e6e",
    green = "#82f76e",
    blue = "#6e72f7",
    yellow = "#ffdd33",
    orange = "#ff8833",
    white = "#f1e6ff",
    magenta = "#9e39e6",
    funcbuiltin = "#a485dd",
    highlight = "#212121",
    highlight_overlay = "#212111",
    highlight_inactive = "#222222",
    delimiter = "#58cd8b",
    none = "NONE",
}

colors.remaps = {
    plugins = {
        telescope = {
            TelescopeSelection = { bg = colors.highlight_inactive },
            TelescopeMatching = { fg = colors.blue },
            TelescopeBorder = { fg = colors.bg_alt, bg = colors.bg_alt },
            TelescopePromptCounter = { fg = colors.funcbuiltin },
            TelescopePromptPrefix = { fg = colors.blue, bg = colors.bg_alt },
            TelescopeResultsTitle = { fg = colors.bg_alt, bg = colors.blue },
            TelescopePreviewTitle = { fg = colors.bg_alt, bg = colors.green },
            TelescopePromptTitle = { fg = colors.bg_alt, bg = colors.yellow },
            TelescopePreviewNormal = { bg = colors.bg_alt },
            TelescopeResultsNormal = { bg = colors.bg_alt },
            TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_alt },
            TelescopePromptBorder = { fg = colors.highlight_inactive, bg = colors.bg_alt },
            TelescopeSelectionCaret = { fg = colors.bg_alt, bg = colors.bg_alt },
        }
    }
}

return colors
