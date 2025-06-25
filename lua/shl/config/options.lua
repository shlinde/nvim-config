-- [[ Options ]]

-- define <leader> and <localleader> keys
-- you should use `vim.keycode` to translate keycodes or pass raw keycode values like `" "` instead of just `"<space>"`
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<cr>")

vim.o.termguicolors = true  -- enable rgb colors

if pcall(require, "modus-themes") then
	require("modus-themes").setup {
		variant = "deuteranopia",
	}
	vim.cmd([[colorscheme modus]])
else
	vim.cmd([[colorscheme koehler]])
end

vim.o.cursorline = true     -- enable cursor line

vim.o.number = true         -- enable line number
vim.o.relativenumber = true -- and relative line number

vim.o.pumheight = 10        -- max height of completion menu
vim.o.completeopt = "menu,menuone,popup,fuzzy" -- modern completion menu

vim.o.confirm = true     -- show dialog for unsaved file(s) before quit
vim.o.updatetime = 200   -- save swap file with 200ms debouncing

vim.o.ignorecase = true  -- case-insensitive search

vim.o.smartcase = true   -- , until search pattern contains upper case characters


vim.o.smartindent = true -- auto-indenting when starting a new line
vim.o.shiftround = true  -- round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 0     -- 0 to follow the 'tabstop' value
vim.o.tabstop = 4        -- tab width

vim.o.undofile = true    -- enable persistent undo
vim.o.undolevels = 10000 -- 10x more undo levels

vim.o.backup       = false          -- Don't store backup
vim.o.backup       = false          -- Don't store backup
vim.o.mouse        = 'a'            -- Enable mouse
vim.o.mousescroll  = 'ver:25,hor:6' -- Customize mouse scroll
vim.o.switchbuf    = 'usetab'       -- Use already opened buffers when switching
vim.o.writebackup  = false          -- Don't store backup (better performance)
vim.o.undofile     = true           -- Enable persistent undo

vim.o.shada        = "'100,<50,s10,:1000,/100,@100,h" -- Limit what is stored in ShaDa file

vim.cmd('filetype plugin indent on') -- Enable all filetype plugins

vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"



-- remove netrw banner for cleaner looking
vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1

vim.api.nvim_set_hl(0, "NetrwDir", { fg = "#808080" }) -- GUI/true color
vim.api.nvim_set_hl(0, "NetrwLink", { fg = "#606060" }) -- GUI/true color

vim.o.fillchars = table.concat(
  -- Special UI symbols
  { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
  ','
)

-- Statusbar - good if you don't want to use a plugin.
vim.o.statusline = "[%<%.20f][%{&fenc==''?&enc:&fenc}]%y%m%r%h%=%([Line: %l Column: %c %P]%)"

vim.opt.makeprg = "just"


-- FzfLua
if pcall(require, "fzf-lua") then
	require("fzf-lua").setup { "fzf-native" }


	-- Use FzfLua for file path completions
	vim.keymap.set(
		{ "n", "v", "i" },
		"<C-x><C-f>",
		function() require("fzf-lua").complete_path() end,
		{ silent = true, desc = "Fuzzy complete path" }
	)
	
end

-- Treesitter
if pcall(require, "nvim-treesitter") then

	require("nvim-treesitter.configs").setup {
		ensure_installed = { "c", "cpp", "vim", "lua", "vimdoc", "query", "markdown", "markdown_inline", "python", "toml", "yaml" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- in normal mode, start incremental selection
				node_incremental = "grn", -- in visual mode, increment to the upper named parent
				scope_incremental = "grc", -- in visual mode, increment to the upper scope
				node_decremental = "grm", -- in visual mode, decremtn to the previous named node
			}
		},
		indent = {
			enable = true,
		},
		text_objects = {
			enabled = true,
		}
	}
	vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
end


vim.o.statusline = "%!v:lua.require('shl.config.statusline').run()"
