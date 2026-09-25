return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    vim.g.snacks_animate = false
  end,
  opts = {
    animate = { enabled = false },
    scroll = { enabled = false },
    bigfile = { enabled = true },
    picker = {
      enabled = true,
      icons = {
        git = {
          enabled = true,
          commit = "󰜘 ",
          staged = "●",
          added = "",
          deleted = "",
          ignored = " ",
          modified = "○",
          renamed = "",
          unmerged = " ",
          untracked = "",
        },
      },
    },
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    indent = {
      enabled = true,
      animate = { enabled = false },
    },
    words = { enabled = true },
    terminal = { enabled = true },
    quickfile = { enabled = false },
    statuscolumn = {
      enabled = true,
      folds = { open = true },
    },
  },
}
