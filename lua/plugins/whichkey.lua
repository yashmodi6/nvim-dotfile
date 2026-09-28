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
      { "<leader>s", group = "Splits" },
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Code" },
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Terminal / Toggle / Theme" },
    },
  },
}
