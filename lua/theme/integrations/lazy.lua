return function(colors, theme)
  return {
    LazyH1 = { bg = colors.green, fg = colors.black },
    LazyButton = { bg = colors.one_bg, fg = colors.light_grey },
    LazyH2 = { fg = colors.red, bold = true, underline = true },
    LazyReasonPlugin = { fg = colors.red },
    LazyValue = { fg = colors.teal },
    LazyDir = { fg = theme.base05 },
    LazyUrl = { fg = theme.base05 },
    LazyCommit = { fg = colors.green },
    LazyNoCond = { fg = colors.red },
    LazySpecial = { fg = colors.blue },
    LazyReasonFt = { fg = colors.purple },
    LazyOperator = { fg = colors.white },
  }
end
