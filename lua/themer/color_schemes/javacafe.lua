local colors = {
    flavour = "dark",
    bg = "#131a21",
    bg_alt = "#10171e",
    bg_float = "#1f272e",
    inactive = "#29343d",
    subtle = "#3b4b58",
    fg = "#eaeaea",
    red = "#f9929b",
    yellow = "#fbdf90",
    orange = "#fbdf90",
    blue = "#a3b8ef",
    green = "#9ce5c0",
    magenta = "#ccaced",
    highlight = "#565c64",
    highlight_inactive = "#353b45",
    highlight_overlay = "#30343c",
    none = "NONE",
}

require("themer.color_schemes.config").options = {
    styles = {
        comments = { italic = true, bold = false },
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

return colors
