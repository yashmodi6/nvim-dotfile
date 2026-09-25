local M = {}

local modules = {
  "defaults",
  "syntax",
  "treesitter",
  "lsp",
  "blink",
  "git",
  "whichkey",
  "flash",
  "markdown",
  "snacks",
  "statusline",
  "lazy",
}

function M.get_highlights(palette)
  local colors = palette.base_30
  local theme = palette.base_16

  local hl = {}

  for _, mod in ipairs(modules) do
    local mod_hl = require("theme.integrations." .. mod)(colors, theme)
    for group, opts in pairs(mod_hl) do
      hl[group] = opts
    end
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
