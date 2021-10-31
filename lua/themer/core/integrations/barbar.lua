local util = require("themer.utils.util")

local hi = {}

function hi.get(cp)
    return {
        BufferTabpageFill = { bg = cp.none },
        BufferCurrent = { fg = cp.fg, bg = cp.bg_float },
        BufferCurrentIndex = { fg = cp.fg, bg = cp.bg_float },
        BufferCurrentMod = { fg = cp.green, bg = cp.bg_float },
        BufferCurrentSign = { fg = cp.subtle, bg = cp.bg_float },
        BufferInactive = { fg = cp.subtle },
        BufferInactiveIndex = { fg = cp.subtle },
        BufferInactiveMod = { fg = cp.green },
        BufferInactiveSign = { fg = cp.subtle },
        BufferVisible = { fg = cp.subtle },
        BufferVisibleIndex = { fg = cp.subtle },
        BufferVisibleMod = { fg = cp.green },
        BufferVisibleSign = { fg = cp.subtle },
    }
end

return hi
