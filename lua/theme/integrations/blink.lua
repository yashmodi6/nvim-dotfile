return function(colors, theme)
  local hl = {
    BlinkCmpMenu = { bg = colors.black },
    BlinkCmpMenuBorder = { fg = colors.grey_fg },
    BlinkCmpMenuSelection = { link = "PmenuSel", bold = true },
    BlinkCmpScrollBarThumb = { bg = colors.grey },
    BlinkCmpScrollBarGutter = { bg = colors.black2 },
    BlinkCmpLabel = { fg = colors.white },
    BlinkCmpLabelDeprecated = { fg = colors.red, strikethrough = true },
    BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
    BlinkCmpLabelDetail = { fg = colors.light_grey },
    BlinkCmpLabelDescription = { fg = colors.light_grey },
    BlinkCmpSource = { fg = colors.grey_fg },
    BlinkCmpGhostText = { fg = colors.grey_fg },
    BlinkCmpDoc = { bg = colors.black },
    BlinkCmpDocBorder = { fg = colors.grey_fg },
    BlinkCmpDocSeparator = { fg = colors.grey },
    BlinkCmpDocCursorLine = { bg = colors.one_bg },
    BlinkCmpSignatureHelp = { bg = colors.black },
    BlinkCmpSignatureHelpBorder = { fg = colors.grey_fg },
    BlinkCmpSignatureHelpActiveParameter = { fg = colors.blue, bold = true },
  }

  local kinds = {
    Constant = theme.base09,
    Function = theme.base0D,
    Identifier = theme.base08,
    Field = theme.base08,
    Variable = theme.base05,
    Snippet = colors.red,
    Text = theme.base0B,
    Structure = theme.base0E,
    Type = theme.base0A,
    Keyword = theme.base0E,
    Method = theme.base0D,
    Constructor = theme.base0C,
    Folder = theme.base07,
    Module = theme.base0A,
    Property = theme.base08,
    Enum = colors.blue,
    Unit = theme.base0E,
    Class = colors.teal,
    File = theme.base07,
    Interface = colors.green,
    Color = colors.white,
    Reference = theme.base05,
    EnumMember = colors.purple,
    Struct = theme.base0E,
    Value = colors.cyan,
    Event = colors.yellow,
    Operator = theme.base05,
    TypeParameter = theme.base08,
    Copilot = colors.green,
    Codeium = colors.vibrant_green,
    TabNine = colors.baby_pink,
    SuperMaven = colors.yellow,
  }

  for kind, color in pairs(kinds) do
    hl["BlinkCmpKind" .. kind] = { fg = color }
  end

  return hl
end
