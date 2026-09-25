return function(colors, _)
  local hl = {
    StatusLine = { bg = colors.statusline_bg },
    StatusLineNC = { bg = colors.darker_black },
    St_gitIcons = { fg = colors.light_grey, bg = colors.statusline_bg, bold = true },
    St_Lsp = { fg = colors.nord_blue, bg = colors.statusline_bg },
    St_LspMsg = { fg = colors.green, bg = colors.statusline_bg },
    St_EmptySpace = { fg = colors.grey, bg = colors.lightbg },
    St_file = { bg = colors.lightbg, fg = colors.white },
    St_file_sep = { bg = colors.statusline_bg, fg = colors.lightbg },
    St_cwd_icon = { fg = colors.one_bg, bg = colors.red },
    St_cwd_text = { fg = colors.white, bg = colors.lightbg },
    St_cwd_sep = { fg = colors.red, bg = colors.statusline_bg },
    St_pos_sep = { fg = colors.green, bg = colors.lightbg },
    St_pos_icon = { fg = colors.black, bg = colors.green },
    St_pos_text = { fg = colors.green, bg = colors.lightbg },
    St_lspError = { fg = colors.red, bg = colors.statusline_bg },
    St_lspWarning = { fg = colors.yellow, bg = colors.statusline_bg },
    St_LspHints = { fg = colors.purple, bg = colors.statusline_bg },
    St_LspInfo = { fg = colors.green, bg = colors.statusline_bg },
  }

  local mode_colors = {
    Normal = "nord_blue",
    Visual = "cyan",
    Insert = "dark_purple",
    Terminal = "green",
    NTerminal = "yellow",
    Replace = "orange",
    Confirm = "teal",
    Command = "green",
    Select = "blue",
  }

  for mode, col in pairs(mode_colors) do
    hl["St_" .. mode .. "Mode"] = { fg = colors.black, bg = colors[col], bold = true }
    hl["St_" .. mode .. "ModeSep"] = { fg = colors[col], bg = colors.grey }
  end

  return hl
end
