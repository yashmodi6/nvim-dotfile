local M = {}

M.hex2rgb = function(hex)
  local hash = string.sub(hex, 1, 1) == "#"
  if string.len(hex) ~= (7 - (hash and 0 or 1)) then
    return nil
  end

  local offset = hash and 0 or 1
  local r = tonumber(hex:sub(2 - offset, 3 - offset), 16)
  local g = tonumber(hex:sub(4 - offset, 5 - offset), 16)
  local b = tonumber(hex:sub(6 - offset, 7 - offset), 16)
  return r, g, b
end

M.rgb2hex = function(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

M.mix = function(first, second, strength)
  strength = strength or 50

  local s = strength / 100
  local r1, g1, b1 = M.hex2rgb(first)
  local r2, g2, b2 = M.hex2rgb(second)

  if r1 == nil or r2 == nil then
    return first
  end

  if s == 0 then
    return first
  elseif s == 1 then
    return second
  end

  local r3 = r1 * (1 - s) + r2 * s
  local g3 = g1 * (1 - s) + g2 * s
  local b3 = b1 * (1 - s) + b2 * s

  return M.rgb2hex(r3, g3, b3)
end

return M
