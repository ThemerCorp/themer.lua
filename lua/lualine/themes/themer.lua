local colors = require("themer.api.colors")(require("themer.config")("get").colorscheme)
local themer = {}

themer.normal = {
a = { bg = colors.accent, fg = colors.bg.alt },
b = { bg = colors.bg.alt, fg = colors.accent },
c = { bg = colors.bg.alt, fg = colors.dimmed.subtle },
}

themer.insert = {
a = { bg = colors.diff.add, fg = colors.bg.alt },
b = { bg = colors.bg.alt, fg = colors.diff.add },
}

themer.command = {
a = { bg = colors.diagnostic.warn, fg = colors.bg.alt },
b = { bg = colors.dimmed.subtle, fg = colors.diagnostic.warn },
}

themer.visual = {
a = { bg = colors.accent, fg = colors.bg.selected },
b = { bg = colors.dimmed.subtle, fg = colors.accent },
}

themer.replace = {
a = { bg = colors.diff.delete, fg = colors.bg.alt },
b = { bg = colors.dimmed.subtle, fg = colors.diff.delete },
}

themer.inactive = {
a = { bg = colors.bg.alt, fg = colors.accent },
b = { bg = colors.bg.alt, fg = colors.dimmed.subtle, gui = "bold" },
c = { bg = colors.bg.alt, fg = colors.dimmed.subtle },
}

return themer
