local util = {}

util.bg = "#000000"
util.fg = "#ffffff"
util.brightness = 0.3

--- hex to rgb
--- @param hex string
function util.hex2rgb(hex)
  hex = hex:gsub("#", "")
  return { tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6)) }
end

--- blend colors
--- @param fg string
--- @param bg string
--- @param alpha number
function util.blend(fg, bg, alpha)
  bg = util.hex2rgb(bg)
  fg = util.hex2rgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

--- darken colors
--- @param hex string
--- @param amount number
--- @param bg string
function util.darken(hex, amount, bg)
  return util.blend(hex, bg or util.bg, math.abs(amount))
end

--- lighten colors
--- @param hex string
--- @param amount number
--- @param fg string
function util.lighten(hex, amount, fg)
  return util.blend(hex, fg or util.fg, math.abs(amount))
end

return util
