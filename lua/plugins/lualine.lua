return {
  "nvim-lualine/lualine.nvim",
  event = "User FilePost",
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "snacks_dashboard", "snacks_explorer" },
      },
    },
    sections = {
      lualine_b = {
        "branch",
        {
          "diff",
          symbols = {
            added = " ",
            modified = "○ ",
            removed = " ",
          },
        },
        "diagnostics",
      },
    },
  },
}
