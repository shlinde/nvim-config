-- Open help windows to the right in vertical split
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd("wincmd L") -- Move to far right
      if vim.fn.winwidth(0) < 78 then -- Help text needs at least 78 chars
        vim.cmd("wincmd T") -- Move to new tab if not enough width
      end
    end
  end,
})
