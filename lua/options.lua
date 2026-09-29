local opt = vim.opt
local g = vim.g

-- Disable default provider detection
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Line numbers & cursor
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.scrolloff = 8
opt.smoothscroll = true
opt.virtualedit = "block"
opt.signcolumn = "yes"

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4
opt.wrap = false
opt.linebreak = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Appearance
opt.termguicolors = true
opt.showmode = false
opt.ruler = false
opt.shortmess:append "sI"
opt.laststatus = 3
opt.statusline = "%!v:lua.require('statusline').generate()"

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldinner = " ",
  foldclose = "",
}

-- Folds
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- System
opt.clipboard = "unnamedplus"
opt.updatetime = 200
opt.timeoutlen = 300
opt.synmaxcol = 300
opt.redrawtime = 1500
opt.undofile = true
opt.swapfile = false
opt.mouse = "a"
opt.confirm = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
