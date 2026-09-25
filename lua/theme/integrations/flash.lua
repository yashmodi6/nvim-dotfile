return function(colors, theme)
  return {
    FlashBackdrop = { fg = colors.grey_fg },
    FlashMatch = { bg = colors.one_bg2, fg = colors.blue },
    FlashCurrent = { bg = colors.red, fg = colors.black },
    FlashLabel = { bg = colors.red, fg = colors.black, bold = true },
    FlashPrompt = { fg = colors.blue },
    FlashPromptIcon = { fg = colors.red },
  }
end
