local is_win = vim.fn.has("win32") == 1
local version_cache = {}

local function normalize(path)
  return (path:gsub("\\", "/"))
end

local function get_python_version(python_path)
  if version_cache[python_path] then
    return version_cache[python_path]
  end

  local norm_path = normalize(python_path)
  local venv_root = vim.fs.dirname(vim.fs.dirname(norm_path))
  local cfg_path = venv_root .. "/pyvenv.cfg"
  local f = io.open(cfg_path, "r")
  if f then
    for line in f:lines() do
      local v = line:match("^version%s*=%s*([%d%.]+)")
      if v then
        f:close()
        version_cache[python_path] = v
        return v
      end
    end
    f:close()
  end

  local out = vim.fn.system({ python_path, "--version" })
  local v = out:match("Python%s+([%d%.]+)")
  if v then
    version_cache[python_path] = v
    return v
  end

  version_cache[python_path] = ""
  return ""
end

local function format_display(filename, source)
  local ver = get_python_version(filename)
  local ver_str = ver ~= "" and (" (" .. ver .. ")") or ""

  if source == "global_python" then
    return "Global Python" .. ver_str
  end

  local home = normalize(vim.env.HOME or vim.env.USERPROFILE or "")
  local cwd = normalize(vim.fn.getcwd())
  local clean = normalize(filename)
    :gsub("/[Bb]in/python[0-9.]*$", "")
    :gsub("/[Ss]cripts/python%.exe$", "")
    :gsub("/[Pp]ython%.exe$", "")

  if cwd ~= "" and vim.startswith(clean, cwd) then
    local rel = clean:sub(#cwd + 2)
    local proj = vim.fs.basename(cwd)
    local display_path = (rel ~= "" and (proj .. "/" .. rel) or proj)
    return display_path .. "/" .. ver_str
  elseif home ~= "" and vim.startswith(clean, home) then
    return "~" .. clean:sub(#home + 1) .. "/" .. ver_str
  end
  return clean .. "/" .. ver_str
end

return {
  "linux-cultist/venv-selector.nvim",
  branch = "main",
  ft = "python",
  cmd = { "VenvSelect", "VenvSelectCached" },
  opts = {
    options = {
      picker = "snacks",
      picker_columns = { "marker", "search_result" },
      picker_options = {
        snacks = {
          layout = {
            preset = "default",
            preview = false,
          },
        },
      },
      on_telescope_result_callback = format_display,
      notify_user_on_venv_activation = true,
      activate_venv_in_terminal = true,
      set_environment_variables = true,
    },
    search = {
      global_python = {
        command = is_win and "where.exe python" or "which python3 2>/dev/null || which python 2>/dev/null",
        type = "system",
      },
    },
  },
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment" },
  },
}
