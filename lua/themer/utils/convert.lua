local convert = {}

--- Convert rgb to hex string
--- @param red integer
--- @param green integer
--- @param blue integer
--- @return string hex
function convert.rgb(red, green, blue)
  local hex = (red * 0x10000) + (green * 0x100) + blue
  return string.format("#%x", hex)
end

--- Convert hsl to rgb to hex string
--- @param hue integer
--- @param saturation integer
--- @param lightness integer
--- @return string hex
function convert.hsl(hue, saturation, lightness)
  hue = hue / 360
  saturation = saturation / 100
  lightness = lightness / 100

  local r, g, b

  if saturation == 0 then
    r, g, b = lightness, lightness, lightness
  else
    local function hue2rgb(p, q, t)
      if t < 0 then
        t = t + 1
      end
      if t > 1 then
        t = t - 1
      end
      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      end
      if t < 1 / 2 then
        return q
      end
      if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      end
      return p
    end

    local q = lightness < 0.5 and lightness * (1 + saturation) or lightness + saturation - lightness * saturation
    local p = 2 * lightness - q
    r = hue2rgb(p, q, hue + 1 / 3)
    g = hue2rgb(p, q, hue)
    b = hue2rgb(p, q, hue - 1 / 3)
  end

  local red = math.floor(r * 255)
  local green = math.floor(g * 255)
  local blue = math.floor(b * 255)
  return convert.rgb(red, green, blue)
end

return convert
