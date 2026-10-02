return {
  "echasnovski/mini.nvim",
  version = false,
  event = "User FilePost",
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").setup()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
  config = function()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.ai").setup()
    require("mini.splitjoin").setup()
    require("mini.move").setup()
  end,
}
