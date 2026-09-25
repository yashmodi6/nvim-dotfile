return {
  "linux-cultist/venv-selector.nvim",
  branch = "main",
  ft = "python",
  cmd = { "VenvSelect", "VenvSelectCached" },
  opts = {
    options = {
      picker = "snacks",
      notify_user_on_venv_activation = true,
      activate_venv_in_terminal = true,
      set_environment_variables = true,
    },
  },
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment" },
  },
}
