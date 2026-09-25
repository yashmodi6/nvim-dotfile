return {
  "folke/which-key.nvim",
  keys = {
    { "<leader>", desc = "Leader keys" },
    { "<C-w>", desc = "Window keys" },
    { '"', desc = "Register keys" },
    { "'", desc = "Mark keys" },
    { "`", desc = "Mark keys" },
    { "g", desc = "Goto keys" },
    { "z", desc = "Fold keys" },
    { "]", desc = "Next reference" },
    { "[", desc = "Prev reference" },
  },
  cmd = "WhichKey",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>f", group = "Find / Search" },
      { "<leader>g", group = "Git" },
      { "<leader>r", group = "Refactor / Rename" },
      { "<leader>c", group = "Code" },
      { "<leader>t", group = "Terminal / Theme" },
    },
  },
}
