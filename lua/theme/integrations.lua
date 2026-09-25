local mix = require("theme.colors").mix

local M = {}

function M.get_highlights(palette)
  local colors = palette.base_30
  local theme = palette.base_16

  local hl = {
    -- Defaults
    Normal = { fg = theme.base05, bg = theme.base00 },
    NormalFloat = { bg = colors.darker_black },
    FloatBorder = { fg = colors.blue },
    FloatTitle = { fg = colors.white, bg = colors.grey },
    WinSeparator = { fg = colors.line },
    Cursor = { fg = theme.base00, bg = theme.base05 },
    CursorLine = { bg = colors.black2 },
    CursorColumn = { bg = theme.base01 },
    ColorColumn = { bg = colors.black2 },
    CursorLineNr = { fg = colors.white },
    LineNr = { fg = colors.grey },
    SignColumn = { fg = theme.base03 },
    FoldColumn = { fg = theme.base0F, bg = "none" },
    Folded = { fg = colors.light_grey, bg = colors.black2 },

    Pmenu = { bg = colors.one_bg },
    PmenuSbar = { bg = colors.one_bg },
    PmenuSel = { bg = colors.pmenu_bg, fg = colors.black },
    PmenuThumb = { bg = colors.grey },

    MatchWord = { bg = colors.grey, fg = colors.white },
    MatchParen = { link = "MatchWord" },
    Comment = { fg = colors.grey_fg },

    Search = { fg = theme.base01, bg = theme.base0A },
    IncSearch = { fg = theme.base01, bg = theme.base09 },
    Substitute = { fg = theme.base01, bg = theme.base0A },
    Visual = { bg = theme.base02 },
    VisualNOS = { fg = theme.base08 },

    Error = { fg = theme.base00, bg = theme.base08 },
    ErrorMsg = { fg = theme.base08, bg = theme.base00 },
    WarningMsg = { fg = theme.base08 },
    Question = { fg = theme.base0D },
    Title = { fg = theme.base0D },
    ModeMsg = { fg = theme.base0B },
    MoreMsg = { fg = theme.base0B },
    NonText = { fg = theme.base03 },
    SpecialKey = { fg = theme.base03 },
    Directory = { fg = theme.base0D },
    Conceal = { bg = "NONE" },
    QuickFixLine = { bg = theme.base01 },

    Added = { fg = colors.green },
    Removed = { fg = colors.red },
    Changed = { fg = colors.yellow },
    healthSuccess = { bg = colors.green, fg = colors.black },

    -- Syntax
    Boolean = { fg = theme.base09 },
    Character = { fg = theme.base08 },
    Conditional = { fg = theme.base0E },
    Constant = { fg = theme.base09 },
    Define = { fg = theme.base0E, sp = "none" },
    Delimiter = { fg = theme.base0F },
    Float = { fg = theme.base09 },
    Variable = { fg = theme.base05 },
    Function = { fg = theme.base0D },
    Identifier = { fg = theme.base08, sp = "none" },
    Include = { fg = theme.base0D },
    Keyword = { fg = theme.base0E },
    Label = { fg = theme.base0A },
    Number = { fg = theme.base09 },
    Operator = { fg = theme.base05, sp = "none" },
    PreProc = { fg = theme.base0A },
    Repeat = { fg = theme.base0A },
    Special = { fg = theme.base0C },
    SpecialChar = { fg = theme.base0F },
    Statement = { fg = theme.base08 },
    StorageClass = { fg = theme.base0A },
    String = { fg = theme.base0B },
    Structure = { fg = theme.base0E },
    Tag = { fg = theme.base0A },
    Todo = { fg = theme.base0A, bg = theme.base01 },
    Type = { fg = theme.base0A, sp = "none" },
    Typedef = { fg = theme.base0A },

    -- Treesitter
    ["@variable"] = { fg = theme.base05 },
    ["@variable.builtin"] = { fg = theme.base09 },
    ["@variable.parameter"] = { fg = theme.base08 },
    ["@variable.member"] = { fg = theme.base08 },
    ["@variable.member.key"] = { fg = theme.base08 },
    ["@module"] = { fg = theme.base08 },

    ["@constant"] = { fg = theme.base09 },
    ["@constant.builtin"] = { fg = theme.base09 },
    ["@constant.macro"] = { fg = theme.base08 },

    ["@string"] = { fg = theme.base0B },
    ["@string.regex"] = { fg = theme.base0C },
    ["@string.escape"] = { fg = theme.base0C },
    ["@character"] = { fg = theme.base08 },
    ["@number"] = { fg = theme.base09 },
    ["@number.float"] = { fg = theme.base09 },

    ["@annotation"] = { fg = theme.base0F },
    ["@attribute"] = { fg = theme.base0A },
    ["@error"] = { fg = theme.base08 },

    ["@keyword"] = { fg = theme.base0E },
    ["@keyword.function"] = { fg = theme.base0E },
    ["@keyword.return"] = { fg = theme.base0E },
    ["@keyword.operator"] = { fg = theme.base0E },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.conditional"] = { fg = theme.base0E },
    ["@keyword.conditional.ternary"] = { fg = theme.base0E },
    ["@keyword.repeat"] = { fg = theme.base0A },
    ["@keyword.storage"] = { fg = theme.base0A },
    ["@keyword.directive.define"] = { fg = theme.base0E },
    ["@keyword.directive"] = { fg = theme.base0A },
    ["@keyword.exception"] = { fg = theme.base08 },

    ["@function"] = { fg = theme.base0D },
    ["@function.builtin"] = { fg = theme.base0D },
    ["@function.macro"] = { fg = theme.base08 },
    ["@function.call"] = { fg = theme.base0D },
    ["@function.method"] = { fg = theme.base0D },
    ["@function.method.call"] = { fg = theme.base0D },
    ["@constructor"] = { fg = theme.base0C },

    ["@operator"] = { fg = theme.base05 },
    ["@reference"] = { fg = theme.base05 },
    ["@punctuation.bracket"] = { fg = theme.base0F },
    ["@punctuation.delimiter"] = { fg = theme.base0F },
    ["@symbol"] = { fg = theme.base0B },
    ["@tag"] = { fg = theme.base0A },
    ["@tag.attribute"] = { fg = theme.base08 },
    ["@tag.delimiter"] = { fg = theme.base0F },
    ["@type.builtin"] = { fg = theme.base0A },
    ["@property"] = { fg = theme.base08 },

    ["@comment"] = { fg = colors.grey_fg },
    ["@comment.todo"] = { fg = colors.grey, bg = colors.white },
    ["@comment.warning"] = { fg = colors.black2, bg = theme.base09 },
    ["@comment.note"] = { fg = colors.black, bg = colors.blue },
    ["@comment.danger"] = { fg = colors.black2, bg = colors.red },

    ["@diff.plus"] = { fg = colors.green },
    ["@diff.minus"] = { fg = colors.red },
    ["@diff.delta"] = { fg = colors.light_grey },

    -- LSP Diagnostics
    DiagnosticHint = { fg = colors.purple },
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.green },
    DiagnosticSignHint = { fg = colors.purple },
    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = colors.yellow },
    DiagnosticSignInfo = { fg = colors.green },
    DiagnosticUnderlineError = { underline = true, sp = colors.red },
    DiagnosticUnderlineWarn = { underline = true, sp = colors.yellow },
    DiagnosticUnderlineInfo = { underline = true, sp = colors.green },
    DiagnosticUnderlineHint = { underline = true, sp = colors.purple },

    LspReferenceText = { bg = colors.one_bg3 },
    LspReferenceRead = { bg = colors.one_bg3 },
    LspReferenceWrite = { bg = colors.one_bg3 },
    LspSignatureActiveParameter = { fg = colors.blue, bold = true },

    -- Blink.cmp
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

    -- Gitsigns
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.blue },
    GitSignsDelete = { fg = colors.red },
    GitSignsAddNr = { fg = colors.green },
    GitSignsChangeNr = { fg = colors.blue },
    GitSignsDeleteNr = { fg = colors.red },
    GitSignsAddLn = { fg = colors.green },
    GitSignsDeleteLn = { fg = colors.red },
    GitSignsCurrentLineBlame = { fg = colors.grey_fg },

    -- WhichKey
    WhichKey = { fg = colors.blue },
    WhichKeySeparator = { fg = colors.light_grey },
    WhichKeyDesc = { fg = colors.red },
    WhichKeyGroup = { fg = colors.green },
    WhichKeyValue = { fg = colors.green },

    -- Render-Markdown
    ["@markup.heading.1.markdown"] = { fg = colors.red },
    ["@markup.heading.2.markdown"] = { fg = colors.orange },
    ["@markup.heading.3.markdown"] = { fg = colors.yellow },
    ["@markup.heading.4.markdown"] = { fg = colors.green },
    ["@markup.heading.5.markdown"] = { fg = colors.blue },
    ["@markup.heading.6.markdown"] = { fg = colors.purple },
    RenderMarkdownH1Bg = { bg = mix(colors.blue, colors.black, 90) },
    RenderMarkdownH2Bg = { bg = mix(colors.yellow, colors.black, 90) },
    RenderMarkdownH3Bg = { bg = mix(colors.green, colors.black, 90) },
    RenderMarkdownH4Bg = { bg = mix(colors.teal, colors.black, 90) },
    RenderMarkdownH5Bg = { bg = mix(colors.purple, colors.black, 90) },
    RenderMarkdownH6Bg = { bg = mix(colors.pink, colors.black, 90) },

    -- Snacks
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
  }

  -- Blink kind icons
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

  if palette.polish_hl then
    for _, section in pairs(palette.polish_hl) do
      for group, opts in pairs(section) do
        hl[group] = vim.tbl_deep_extend("force", hl[group] or {}, opts)
      end
    end
  end

  return hl
end

return M
