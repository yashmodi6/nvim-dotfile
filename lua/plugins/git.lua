local signs = {
  add = { text = "▎" },
  change = { text = "▎" },
  delete = { text = "" },
  topdelete = { text = "" },
  changedelete = { text = "▎" },
  untracked = { text = "▎" },
}

return {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
  cmd = { "Gitsigns" },
  opts = {
    signs = signs,
    signs_staged = signs,
  },
}
