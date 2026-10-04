local M = {}

function M.load(theme_name)
  theme_name = theme_name or vim.g.colors_name or "catppuccin"

  local normalized = theme_name:gsub("-", "_")
  local ok, palette = pcall(require, "theme.palettes." .. normalized)

  if not ok or type(palette) ~= "table" then
    vim.notify("Palette not found: " .. theme_name, vim.log.levels.WARN)
    return
  end

  vim.cmd "highlight clear"
  vim.o.background = palette.type or "dark"
  vim.g.colors_name = theme_name

  local hl = require("theme.integrations").get_highlights(palette)

  for group, opts in pairs(hl) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end

M.set_theme = M.load

return M
