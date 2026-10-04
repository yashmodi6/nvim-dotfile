return {
  "echasnovski/mini.nvim",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    require("mini.icons").setup()
    require("mini.icons").mock_nvim_web_devicons()
  end,
  config = function()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.ai").setup()
    require("mini.splitjoin").setup()
    require("mini.move").setup()
  end,
}
