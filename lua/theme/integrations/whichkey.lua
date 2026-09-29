return function(colors, theme)
  return {
    WhichKey = { fg = colors.blue },
    WhichKeySeparator = { fg = colors.light_grey },
    WhichKeyDesc = { fg = colors.white },
    WhichKeyGroup = { fg = colors.green },
    WhichKeyValue = { fg = colors.green },
    WhichKeyNormal = { bg = colors.darker_black },
    WhichKeyBorder = { fg = colors.line, bg = colors.darker_black },
    WhichKeyTitle = { fg = colors.nord_blue, bold = true },
  }
end
