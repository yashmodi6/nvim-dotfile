local map = vim.keymap.set

-- Navigation
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Windows & buffers
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>x", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })

-- File explorer
map("n", "<C-n>", function()
  Snacks.explorer()
end, { desc = "Open file explorer" })
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Toggle file explorer" })

-- Terminal
map({ "n", "t" }, "<C-/>", function()
  Snacks.terminal()
end, { desc = "Toggle floating terminal" })
map("n", "<leader>tt", function()
  Snacks.terminal()
end, { desc = "Toggle floating terminal" })

-- Search & picker
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find project files" })

map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Search text in project" })

map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "List open buffers" })

map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent files" })

map("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Search help docs" })

map("n", "<leader>ft", function()
  Snacks.picker.grep { search = "\\b(TODO|FIXME|BUG|NOTE|HACK):" }
end, { desc = "Search TODO comments" })

map("n", "<leader>th", function()
  require("theme").select()
end, { desc = "Theme switcher" })

-- Folding
map("n", "<leader>z", "za", { desc = "Toggle fold" })
map("n", "zR", function()
  require("ufo").openAllFolds()
end, { desc = "Open all folds" })
map("n", "zM", function()
  require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
map("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek fold preview or LSP hover" })

-- Git
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview git hunk" })

-- References
map("n", "]]", function()
  Snacks.words.jump(vim.v.count1)
end, { desc = "Next reference" })
map("n", "[[", function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = "Previous reference" })

-- LSP
map("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
map("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "Go to references" })
map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code actions" })
map("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Select virtual environment" })
map("n", "<leader>d", function()
  vim.diagnostic.open_float()
end, { desc = "Show line error details" })

-- Code runner
local runners = {
  python = "python3 %s",
  lua = "nvim -l %s",
  sh = "bash %s",
  bash = "bash %s",
  javascript = "node %s",
  typescript = "tsx %s",
  c = "gcc %s -o /tmp/a.out && /tmp/a.out",
  cpp = "g++ %s -o /tmp/a.out && /tmp/a.out",
  rust = "cargo run",
  go = "go run %s",
}

local function run_file()
  vim.cmd "silent! write"
  local ft = vim.bo.filetype
  local cmd_fmt = runners[ft]
  if not cmd_fmt then
    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
    return
  end
  local file = vim.fn.expand "%:p"
  local cmd = cmd_fmt:find "%%s" and string.format(cmd_fmt, file) or cmd_fmt
  Snacks.terminal(cmd)
end

map("n", "<leader>cr", run_file, { desc = "Run current file" })
map("n", "<leader>rc", run_file, { desc = "Run current file" })
