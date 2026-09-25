return function(colors, theme)
  return {
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.blue },
    GitSignsDelete = { fg = colors.red },
    GitSignsAddNr = { fg = colors.green },
    GitSignsChangeNr = { fg = colors.blue },
    GitSignsDeleteNr = { fg = colors.red },
    GitSignsAddLn = { fg = colors.green },
    GitSignsDeleteLn = { fg = colors.red },
    GitSignsCurrentLineBlame = { fg = colors.grey_fg },
  }
end
