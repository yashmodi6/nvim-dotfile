return {
  "linux-cultist/venv-selector.nvim",
  branch = "main",
  ft = "python",
  cmd = { "VenvSelect", "VenvSelectCached" },
  opts = {
    options = {
      notify_user_on_venv_activation = true,
      picker_options = {
        snacks = {
          layout = {
            preset = "default",
            preview = false,
          },
        },
      },
    },
  },
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment" },
  },
}
