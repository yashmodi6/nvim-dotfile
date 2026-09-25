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
    dim = {
      animate = { enabled = false },
      scope = {
        min_size = 5,
        max_size = 40,
        siblings = true,
      },
    },
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
    dashboard = {
      enabled = true,
      preset = {
        header = [[
██╗   ██╗ ██████╗ ██╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
╚██╗ ██╔╝██╔═══██╗██║   ██║██╔═══██╗██║   ██║██║████╗ ████║
 ╚████╔╝ ██║   ██║██║   ██║██║   ██║██║   ██║██║██╔████╔██║
  ╚██╔╝  ██║   ██║╚██╗ ██╔╝██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║   ╚██████╔╝ ╚████╔╝ ╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝    ╚═════╝   ╚═══╝   ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
    },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    indent = {
      enabled = true,
      animate = { enabled = false },
    },
    words = { enabled = true },
    terminal = {
      enabled = true,
      win = {
        position = "float",
        border = "single",
        height = 0.8,
        width = 0.8,
      },
    },
    statuscolumn = {
      enabled = true,
      folds = { open = true },
    },
  },
}
