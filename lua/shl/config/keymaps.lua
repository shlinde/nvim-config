
-- Lexplorer
vim.keymap.set('n', '<C-E>', '<cmd>Lexplore 15<cr>', { silent = true })
vim.keymap.set('n', '<leader>e', '<cmd>Lexplore 15<cr>', { silent = true })

-- FzfLua
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { silent = true, desc = "Files"})
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua helptags<cr>', { silent = true, desc = "Helptags"})
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { silent = true, desc = "Buffers"})
vim.keymap.set('n', '<leader>fq', '<cmd>FzfLua quickfix<cr>', { silent = true, desc = "Quickfix"})
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', { silent = true, desc = "Live Grep"})


-- Terminal
vim.keymap.set("n", "<leader>tt", "<cmd>vsplit | terminal<cr>", { noremap = true, silent = true })

--- Remappings
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Send <Esc> to the underlying program from Terminal mode
-- Using Alt-[ (or Meta-[)
vim.api.nvim_set_keymap('t', '<A-[>', '<Esc>', { noremap = true, silent = true })
-- Alternative: Using Ctrl-v Escape (mnemonic: Verbatim escape)
-- vim.api.nvim_set_keymap('t', '<C-v><Esc>', '<Esc>', { noremap = true, silent = true })
--
-- Window switching in Terminal mode using Alt (Meta) + h, j, k, l
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- Window switching in Normal mode using Alt (Meta) + h, j, k, l (for consistency)
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })
