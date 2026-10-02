local map = vim.keymap.set

-- -----------------------------------------------------------------------------
-- General & Navigation
-- -----------------------------------------------------------------------------
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-a>", function()
  local view = vim.fn.winsaveview()
  vim.cmd "%y+"
  vim.fn.winrestview(view)
end, { desc = "Copy active buffer" })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down (visual line)", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up (visual line)", expr = true, silent = true })

-- -----------------------------------------------------------------------------
-- Window Navigation & Resizing
-- -----------------------------------------------------------------------------
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- -----------------------------------------------------------------------------
-- Window Splits (<leader>s)
-- -----------------------------------------------------------------------------
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })
map("n", "<leader>so", "<cmd>only<CR>", { desc = "Close other split windows" })
map("n", "<leader>sm", function()
  Snacks.zen.zoom()
end, { desc = "Toggle maximize split" })

-- -----------------------------------------------------------------------------
-- Buffer Management (<leader>b)
-- -----------------------------------------------------------------------------
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader><Tab>", "<cmd>e #<CR>", { desc = "Switch to alternate buffer" })
map("n", "<leader>x", function()
  Snacks.bufdelete()
end, { desc = "Close current buffer" })
map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Close other buffers" })
map("n", "<leader>ba", function()
  Snacks.bufdelete.all()
end, { desc = "Close all buffers" })

-- -----------------------------------------------------------------------------
-- File Explorer & Terminal
-- -----------------------------------------------------------------------------
map("n", "<C-n>", function()
  Snacks.explorer()
end, { desc = "Open file explorer" })

map("n", "<leader>tt", function()
  Snacks.terminal()
end, { desc = "Toggle floating terminal" })

-- -----------------------------------------------------------------------------
-- Find & Search Pickers (<leader>f)
-- -----------------------------------------------------------------------------
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

-- -----------------------------------------------------------------------------
-- UI Toggles & Theme (<leader>t)
-- -----------------------------------------------------------------------------
map("n", "<leader>th", function()
  require("theme").select()
end, { desc = "Theme switcher" })

map("n", "<leader>td", function()
  Snacks.toggle.dim():toggle()
end, { desc = "Toggle focus dimming" })

map("n", "<leader>tw", function()
  Snacks.toggle.option("wrap", { name = "Word Wrap" }):toggle()
end, { desc = "Toggle word wrap" })

-- -----------------------------------------------------------------------------
-- Code & LSP (<leader>c)
-- -----------------------------------------------------------------------------
map("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })

map("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "Go to references" })

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code actions" })

map("n", "<leader>cr", function()
  vim.lsp.buf.rename()
end, { desc = "Rename symbol" })

map({ "n", "v" }, "<leader>cf", function()
  require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "Format buffer or selection" })

map("n", "<leader>cd", function()
  vim.diagnostic.open_float()
end, { desc = "Show line error details" })

map("n", "<leader>cv", "<cmd>VenvSelect<CR>", { desc = "Select Virtual Environment" })

-- -----------------------------------------------------------------------------
-- Folding (UFO)
-- -----------------------------------------------------------------------------
map("n", "zR", function()
  require("ufo").openAllFolds()
end, { desc = "Open all folds" })

map("n", "zM", function()
  require("ufo").closeAllFolds()
end, { desc = "Close all folds" })

map("n", "zP", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek fold preview or LSP hover" })

-- -----------------------------------------------------------------------------
-- Git & References
-- -----------------------------------------------------------------------------
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview git hunk" })

map("n", "]]", function()
  Snacks.words.jump(vim.v.count1)
end, { desc = "Next reference" })

map("n", "[[", function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = "Previous reference" })

-- -----------------------------------------------------------------------------
-- Session (<leader>q)
-- -----------------------------------------------------------------------------
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore session" })

map("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select session" })

map("n", "<leader>ql", function()
  require("persistence").load { last = true }
end, { desc = "Restore last session" })

map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Don't save current session" })
