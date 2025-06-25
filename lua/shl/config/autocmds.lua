-- Open help windows to the right in vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    -- Move help window to vertical split on the right
    vim.cmd("wincmd L")
    -- Optional: set width of help window
    vim.cmd("vertical resize 80")
  end,
})


-- Treesitter
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})
