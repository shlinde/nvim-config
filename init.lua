require("shl.config.options")
require("shl.config.keymaps")
require("shl.config.autocmds")


if vim.fn.isdirectory(vim.fn.stdpath("config") .. "/lua/work") then
	require("work")
end
