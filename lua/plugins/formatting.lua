return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
      lua = { "stylua" },
      go = { "goimports", "gofumpt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
