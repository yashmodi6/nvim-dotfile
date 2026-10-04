-- -----------------------------------------------------------------------------
-- Autocommands
-- -----------------------------------------------------------------------------

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.hl.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- Treesitter highlighting on filetype detection
vim.api.nvim_create_autocmd("FileType", {
  desc = "Start treesitter highlighting",
  group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- Disable italics in Termux
if vim.env.TERMUX_VERSION or vim.fn.has "termux" == 1 then
  local function disable_italics()
    local hls = vim.api.nvim_get_hl(0, {})
    for group, opts in pairs(hls) do
      local changed = false
      if opts.italic then
        opts.italic = false
        changed = true
      end
      if opts.cterm and opts.cterm.italic then
        opts.cterm.italic = false
        changed = true
      end
      if changed then
        vim.api.nvim_set_hl(0, group, opts)
      end
    end
  end

  vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Disable italics across all highlight groups in Termux",
    group = vim.api.nvim_create_augroup("DisableItalicsTermux", { clear = true }),
    callback = disable_italics,
  })

  disable_italics()
end
