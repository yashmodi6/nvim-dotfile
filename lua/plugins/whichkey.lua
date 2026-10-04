return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  cmd = "WhichKey",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "Buffer local keymaps",
    },
  },
  opts = {
    preset = "modern",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    win = {
      border = "single",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
      mappings = true,
      colors = true,
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>f", group = "Find / Search", icon = { icon = " ", color = "blue" } },
        { "<leader>s", group = "Splits", icon = { icon = "󰤼 ", color = "cyan" } },
        { "<leader>b", group = "Buffers", icon = { icon = "󰈔 ", color = "azure" } },
        { "<leader>c", group = "Code / LSP", icon = { icon = " ", color = "green" } },
        { "<leader>g", group = "Git", icon = { icon = "󰊢 ", color = "orange" } },
        { "<leader>t", group = "Toggle / Theme", icon = { icon = " ", color = "yellow" } },
        { "<leader>q", group = "Session", icon = { icon = "󰁯 ", color = "purple" } },
        { "[", group = "Previous", icon = { icon = " ", color = "grey" } },
        { "]", group = "Next", icon = { icon = " ", color = "grey" } },
        { "g", group = "Goto", icon = { icon = "󰒍 ", color = "blue" } },
        { "z", group = "Folds", icon = { icon = "󰡍 ", color = "green" } },
      },
    },
  },
}
