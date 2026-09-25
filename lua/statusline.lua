local M = {
  state = { lsp_msg = "" },
}

local sep_l = ""
local sep_r = ""

local modes = {
  ["n"] = { "NORMAL", "Normal" },
  ["no"] = { "NORMAL (no)", "Normal" },
  ["nov"] = { "NORMAL (nov)", "Normal" },
  ["noV"] = { "NORMAL (noV)", "Normal" },
  ["noCTRL-V"] = { "NORMAL", "Normal" },
  ["niI"] = { "NORMAL i", "Normal" },
  ["niR"] = { "NORMAL r", "Normal" },
  ["niV"] = { "NORMAL v", "Normal" },
  ["nt"] = { "NTERMINAL", "NTerminal" },
  ["ntT"] = { "NTERMINAL (ntT)", "NTerminal" },

  ["v"] = { "VISUAL", "Visual" },
  ["vs"] = { "V-CHAR (Ctrl O)", "Visual" },
  ["V"] = { "V-LINE", "Visual" },
  ["Vs"] = { "V-LINE", "Visual" },
  ["\22"] = { "V-BLOCK", "Visual" },

  ["i"] = { "INSERT", "Insert" },
  ["ic"] = { "INSERT", "Insert" },
  ["ix"] = { "INSERT", "Insert" },

  ["t"] = { "TERMINAL", "Terminal" },

  ["R"] = { "REPLACE", "Replace" },
  ["Rc"] = { "REPLACE (Rc)", "Replace" },
  ["Rx"] = { "REPLACEa (Rx)", "Replace" },
  ["Rv"] = { "V-REPLACE", "Replace" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "Replace" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },

  ["s"] = { "SELECT", "Select" },
  ["S"] = { "S-LINE", "Select" },
  ["\19"] = { "S-BLOCK", "Select" },
  ["c"] = { "COMMAND", "Command" },
  ["cv"] = { "COMMAND", "Command" },
  ["ce"] = { "COMMAND", "Command" },
  ["cr"] = { "COMMAND", "Command" },
  ["r"] = { "PROMPT", "Confirm" },
  ["rm"] = { "MORE", "Confirm" },
  ["r?"] = { "CONFIRM", "Confirm" },
  ["x"] = { "CONFIRM", "Confirm" },
  ["!"] = { "SHELL", "Terminal" },
}

local function is_active()
  return vim.api.nvim_get_current_win() == (vim.g.statusline_winid or 0)
end

local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

local function mode()
  if not is_active() then
    return ""
  end
  local m = vim.api.nvim_get_mode().mode
  local current = modes[m] or { "NORMAL", "Normal" }
  local mode_hl = "%#St_" .. current[2] .. "Mode#  " .. current[1] .. " "
  local sep_hl = "%#St_" .. current[2] .. "ModeSep#" .. sep_r
  return mode_hl .. sep_hl .. "%#St_EmptySpace#" .. sep_r
end

local function file()
  local bufnr = stbufnr()
  local path = vim.api.nvim_buf_get_name(bufnr)
  local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"
  local icon = "󰈚"

  if name ~= "Empty" then
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if ok then
      local ft_icon = devicons.get_icon(name)
      icon = ft_icon or icon
    end
  end

  return "%#St_file# " .. icon .. " " .. name .. " %#St_file_sep#" .. sep_r
end

local function git()
  local bufnr = stbufnr()
  local git_status = vim.b[bufnr].gitsigns_status_dict
  if not git_status or not git_status.head then
    return ""
  end

  local added = (git_status.added and git_status.added > 0) and ("  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed > 0) and ("  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed > 0) and ("  " .. git_status.removed) or ""
  local branch_name = " " .. git_status.head

  return "%#St_gitIcons# " .. branch_name .. added .. changed .. removed
end

local function lsp_msg()
  return (vim.o.columns < 120 and "") or M.state.lsp_msg
end

local function diagnostics()
  if not rawget(vim, "lsp") then
    return ""
  end
  local bufnr = stbufnr()
  local err = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
  local warn = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })

  local str = ""
  if err > 0 then
    str = str .. "%#St_lspError# " .. err .. " "
  end
  if warn > 0 then
    str = str .. "%#St_lspWarning# " .. warn .. " "
  end
  if hints > 0 then
    str = str .. "%#St_lspHints#󰛩 " .. hints .. " "
  end
  if info > 0 then
    str = str .. "%#St_lspInfo#󰋼 " .. info .. " "
  end
  return str
end

local function lsp()
  if not rawget(vim, "lsp") then
    return ""
  end
  local bufnr = stbufnr()
  local clients = vim.lsp.get_clients { bufnr = bufnr }
  if #clients == 0 then
    return ""
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return (vim.o.columns > 100 and ("%#St_Lsp#   LSP ~ " .. table.concat(names, ", ") .. " "))
    or "%#St_Lsp#   LSP "
end

local function cwd()
  local dir = vim.uv.cwd() or ""
  local name = dir:match "([^/\\]+)[/\\]*$" or dir
  return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. "%#St_cwd_icon#󰉋 %#St_cwd_text# " .. name .. " "))
    or ""
end

local function cursor()
  return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# %l/%v "
end

function M.generate()
  local bufnr = stbufnr()
  local ft = vim.bo[bufnr].filetype
  if ft == "snacks_dashboard" or ft == "snacks_explorer" then
    return ""
  end

  return table.concat {
    mode(),
    file(),
    git(),
    "%=",
    lsp_msg(),
    "%=",
    diagnostics(),
    lsp(),
    cwd(),
    cursor(),
  }
end

local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥", "" }

function M.autocmds()
  vim.api.nvim_create_autocmd("LspProgress", {
    pattern = { "begin", "report", "end" },
    callback = function(args)
      if not args.data or not args.data.params then
        return
      end

      local data = args.data.params.value
      local progress = ""

      if data.percentage then
        local idx = math.max(1, math.floor(data.percentage / 10))
        progress = (spinners[idx] or "") .. " " .. data.percentage .. "%% "
      end

      local loaded = data.message and data.message:match "^(%d+/%d+)" or ""
      local str = progress .. (data.title or "") .. " " .. loaded
      M.state.lsp_msg = (data.kind == "end" and "") or ("%#St_LspMsg#" .. str .. " ")
      vim.cmd.redrawstatus()
    end,
  })
end

return M
