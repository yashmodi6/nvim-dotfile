return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "User FilePost",
  opts = {
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
    fold_virt_text_handler = function(virtText, lnum, endLnum)
      table.insert(virtText, { (" 󰁂 %d "):format(endLnum - lnum), "MoreMsg" })
      return virtText
    end,
  },
}
