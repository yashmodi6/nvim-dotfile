return function(colors, theme)
  return {
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
    LspInlayHint = { bg = colors.black2, fg = colors.light_grey },
  }
end
