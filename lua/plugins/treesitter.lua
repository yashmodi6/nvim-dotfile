return {
  "nvim-treesitter/nvim-treesitter",
  event = "User FilePost",
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter"
    ts.setup()

    -- Automatically install and track common parsers
    ts.install {
      "python",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "json",
      "yaml",
      "toml",
      "bash",
      "c",
      "cpp",
      "rust",
      "go",
      "javascript",
      "typescript",
    }
  end,
}
