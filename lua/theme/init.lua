local M = {}

local compiler = require "theme.compiler"
local cache_file = compiler.get_cache_path()

M.themes = {
  "catppuccin",
  "gruvbox",
  "tokyonight",
  "kanagawa",
  "rosepine",
}

function M.load()
  if vim.uv.fs_stat(cache_file) then
    local fn = loadfile(cache_file)
    if fn then
      fn()
      return
    end
  end

  compiler.compile()
  local fn = loadfile(cache_file)
  if fn then
    fn()
  end
end

function M.set_theme(name)
  compiler.compile(name)
  local fn = loadfile(cache_file)
  if fn then
    fn()
  end
  vim.api.nvim_exec_autocmds("User", { pattern = "ThemeReload", modeline = false })
end

function M.select()
  if _G.Snacks and Snacks.picker then
    Snacks.picker.colorschemes {
      finder = function()
        local items = {}
        for _, name in ipairs(M.themes) do
          table.insert(items, { text = name })
        end
        return items
      end,
    }
  else
    vim.ui.select(M.themes, {
      prompt = "Select Color Scheme:",
      format_item = function(item)
        local current = compiler.get_saved_theme()
        return (item == current and "● " or "  ") .. item
      end,
    }, function(choice)
      if choice then
        M.set_theme(choice)
      end
    end)
  end
end

return M
