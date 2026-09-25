if vim.loader then
  vim.loader.enable()
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require "options"
require("theme").load()

vim.schedule(function()
  require "keymaps"
end)

-- Deferred file loading (User FilePost)
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("FilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if file ~= "" and buftype ~= "nofile" then
      vim.api.nvim_del_augroup_by_name "FilePost"
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
        vim.api.nvim_exec_autocmds("FileType", {})
        pcall(function()
          require("statusline").autocmds()
        end)
      end)
    end
  end,
})

-- Load all plugin specs from lua/plugins/
require("lazy").setup {
  defaults = { lazy = true },
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "default" } },
  checker = { enabled = false },
  change_detection = { notify = false },
  rocks = { enabled = false },
  performance = {
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "matchparen",
        "net",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "osc52",
        "rplugin",
        "rrhelper",
        "spellfile",
        "spellfile_plugin",
        "tar",
        "tarPlugin",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
}
