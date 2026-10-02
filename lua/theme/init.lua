local M = {}

function M.load()
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "catppuccin"

  local palette = require "theme.palettes.catppuccin"
  local hl = require("theme.integrations").get_highlights(palette)

  for group, opts in pairs(hl) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

M.set_theme = M.load

return M
