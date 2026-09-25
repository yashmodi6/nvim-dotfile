return function(colors, _)
  return {
    SnacksPicker = { bg = colors.darker_black },
    SnacksPickerBorder = { fg = colors.blue },
    SnacksPickerMatch = { fg = colors.blue, bold = true },
    SnacksPickerPrompt = { fg = colors.red },
    SnacksPickerInput = { bg = colors.black2 },
    SnacksPickerInputBorder = { fg = colors.blue },
    SnacksPickerSelected = { bg = colors.one_bg2 },
    SnacksPickerDir = { fg = colors.light_grey },
    SnacksPickerGitStatusAdded = { fg = colors.green },
    SnacksPickerGitStatusModified = { fg = colors.yellow },
    SnacksPickerGitStatusDeleted = { fg = colors.red },
    SnacksPickerGitStatusUntracked = { fg = colors.purple },

    SnacksDashboardHeader = { fg = colors.blue },
    SnacksDashboardKey = { fg = colors.orange },
    SnacksDashboardDesc = { fg = colors.white },
    SnacksDashboardIcon = { fg = colors.blue },
    SnacksDashboardFooter = { fg = colors.red },

    SnacksStatusColumnMark = { fg = colors.purple },
    SnacksIndent = { fg = colors.line },
    SnacksIndentScope = { fg = colors.grey },
    SnacksDim = { fg = colors.grey_fg },
  }
end
