return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "User FilePost",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
