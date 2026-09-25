local M = {}

local cache_dir = vim.fn.stdpath "data" .. "/theme"
local cache_file = cache_dir .. "/cache.bin"
local state_file = cache_dir .. "/current.txt"

function M.get_cache_path()
  return cache_file
end

function M.get_saved_theme()
  local f = io.open(state_file, "r")
  if f then
    local name = f:read "*l"
    f:close()
    if name and name ~= "" then
      return name
    end
  end
  return "catppuccin"
end

function M.compile(theme_name)
  theme_name = theme_name or M.get_saved_theme()

  local ok, palette = pcall(require, "theme.palettes." .. theme_name)
  if not ok then
    palette = require "theme.palettes.catppuccin"
    theme_name = "catppuccin"
  end

  local hl_table = require("theme.integrations").get_highlights(palette)

  -- Build Lua code string of all set_hl calls
  local lines = {
    "vim.o.termguicolors = true",
    'vim.o.background = "' .. (palette.type or "dark") .. '"',
    'vim.g.colors_name = "' .. (palette.name or theme_name) .. '"',
  }

  for group, opts in pairs(hl_table) do
    local opt_str = ""
    for k, v in pairs(opts) do
      local val_str
      if type(v) == "string" then
        val_str = '"' .. v .. '"'
      elseif type(v) == "boolean" or type(v) == "number" then
        val_str = tostring(v)
      end
      if val_str then
        opt_str = opt_str .. k .. "=" .. val_str .. ","
      end
    end
    table.insert(lines, 'vim.api.nvim_set_hl(0, "' .. group .. '", {' .. opt_str .. "})")
  end

  local code = "return function()\n" .. table.concat(lines, "\n") .. "\nend"

  -- Ensure cache directory exists
  if not vim.uv.fs_stat(cache_dir) then
    vim.fn.mkdir(cache_dir, "p")
  end

  -- Dump into bytecode
  local chunk = assert(loadstring(code))
  local bytecode = string.dump(chunk(), true)

  local f = io.open(cache_file, "wb")
  if f then
    f:write(bytecode)
    f:close()
  end

  -- Save current theme name
  local sf = io.open(state_file, "w")
  if sf then
    sf:write(theme_name)
    sf:close()
  end

  return cache_file
end

return M
