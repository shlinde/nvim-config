

-- [[ FzfLua ]]
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { silent = true, desc = "Files"})
vim.keymap.set('n', '<leader>pf', '<cmd>FzfLua git_files<cr>', { silent = true, desc = "Files"})
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua helptags<cr>', { silent = true, desc = "Helptags"})
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { silent = true, desc = "Buffers"})
vim.keymap.set('n', '<leader>fq', '<cmd>FzfLua quickfix<cr>', { silent = true, desc = "Quickfix"})
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', { silent = true, desc = "Live Grep"})


-- [[ Terminal ]]
vim.keymap.set("n", "<leader>tt", "<cmd>vsplit | terminal<cr>", { noremap = true, silent = true })

--- Remappings
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Send <Esc> to the underlying program from Terminal mode
-- Using Alt-[ (or Meta-[)
vim.keymap.set('t', '<A-[>', '<Esc>', { noremap = true, silent = true })
-- Alternative: Using Ctrl-v Escape (mnemonic: Verbatim escape)
-- vim.keymap.set('t', '<C-v><Esc>', '<Esc>', { noremap = true, silent = true })
--
-- Window switching in Terminal mode using Alt (Meta) + h, j, k, l
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- Window switching in Normal mode using Alt (Meta) + h, j, k, l (for consistency)
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })


-- [[ Git ]]
vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>", { desc = "Git", noremap = true, silent = true })

-- [[ Which Key ]]
if pcall(require, "which-key") then
	vim.keymap.set("n", "<leader>?", function() require("which-key").show() end, { desc = "Buffer Local Keymaps" })
end


-- [[ WSL ]]
if vim.fn.has("wsl") then
	vim.keymap.set("n", "<leader>E", "<cmd>!explorer.exe .<cr>", { desc = "Open OS Explorer", silent = true })
end


local toggle_oil_split = function()
	local find_oil_win = function()
		local wins = vim.api.nvim_list_wins()
		for _, win_id in ipairs(wins) do 
			local buf_id = vim.api.nvim_win_get_buf(win_id)
			local success, ft = pcall(vim.api.nvim_buf_get_option, buf_id, 'filetype')
			if success and ft == "oil" then
				return win_id
			end
		end
		return nil
	end

	local oil_win_id = find_oil_win()
	local current_win_id = vim.api.nvim_get_current_win()

	if oil_win_id then
		if oil_win_id == current_win_id then
			vim.cmd("close")
		else
			vim.api.nvim_set_current_win(oil_win_id)
		end
	else
		vim.cmd("leftabove 35 vsplit | Oil")
	end
end

vim.api.nvim_create_user_command("ToggleOilSplit", toggle_oil_split, {
	desc = "Toggle Oil file explorer in a vertical split",
})


-- [[ File Explorer ]]
if pcall(require, "oil") then
	require("oil").setup()

	vim.keymap.set("n", "<leader>e", toggle_oil_split, { desc = "File Tree", noremap = true, silent = true})

else
	vim.keymap.set('n', '<leader>e', '<cmd>Lexplore 15<cr>', { silent = true })
end
