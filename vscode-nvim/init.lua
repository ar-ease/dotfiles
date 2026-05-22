--------------------------------------------------
-- VSCode Neovim Setup
--------------------------------------------------

vim.g.vscode = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--------------------------------------------------
-- Lazy.nvim bootstrap
--------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------
-- Plugins
--------------------------------------------------

require("lazy").setup({
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = false,
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
			},
		},
	},
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			require("mini.ai").setup()
		end,
	},
})

--------------------------------------------------
-- Basic Keymaps
--------------------------------------------------

keymap.set("n", "'", ";")
keymap.set("i", "<CR>", "<CR><C-g>u", { noremap = true })
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Fold-aware j/k: plain j/k use VSCode's cursor commands so folded regions
-- don't auto-unfold when moving across them. Counted motions (5j, 10k)
-- still use native vim movement so counts keep working.
keymap.set("n", "j", function()
	if vim.v.count == 0 then
		vim.fn.VSCodeNotify("cursorDown")
	else
		vim.cmd("normal! " .. vim.v.count .. "j")
	end
end, opts)

keymap.set("n", "k", function()
	if vim.v.count == 0 then
		vim.fn.VSCodeNotify("cursorUp")
	else
		vim.cmd("normal! " .. vim.v.count .. "k")
	end
end, opts)

--------------------------------------------------
-- VSCode Navigation (FIXED)
--------------------------------------------------

keymap.set("n", "<C-o>", '<Cmd>call VSCodeNotify("workbench.action.navigateBack")<CR>', opts)
keymap.set("n", "<C-i>", '<Cmd>call VSCodeNotify("workbench.action.navigateForward")<CR>', opts)

-- Optional safe fallback
keymap.set("n", "<leader>o", '<Cmd>call VSCodeNotify("workbench.action.navigateBack")<CR>', opts)
keymap.set("n", "<leader>i", '<Cmd>call VSCodeNotify("workbench.action.navigateForward")<CR>', opts)

--------------------------------------------------
-- VSCode Actions
--------------------------------------------------

keymap.set("n", "<Leader>w", '<Cmd>call VSCodeNotify("workbench.action.files.save")<CR>', opts)
keymap.set("n", "<Leader>q", '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>', opts)
keymap.set("n", "<Leader>Q", '<Cmd>call VSCodeNotify("workbench.action.closeAllEditors")<CR>', opts)

keymap.set("n", "<Leader>f", '<Cmd>call VSCodeNotify("revealInExplorer")<CR>', opts)
keymap.set("n", "<Leader>t", '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>', opts)
keymap.set("n", "<Leader>e", '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>', opts)

keymap.set("n", "te", '<Cmd>call VSCodeNotify("workbench.action.files.newUntitledFile")<CR>', opts)
keymap.set("n", "tw", '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>', opts)

keymap.set("n", "<leader>ss", '<Cmd>call VSCodeNotify("workbench.action.splitEditorDown")<CR>', opts)
keymap.set("n", "<leader>sv", '<Cmd>call VSCodeNotify("workbench.action.splitEditorRight")<CR>', opts)

keymap.set("n", "sh", '<Cmd>call VSCodeNotify("workbench.action.focusLeftGroup")<CR>', opts)
keymap.set("n", "sk", '<Cmd>call VSCodeNotify("workbench.action.focusAboveGroup")<CR>', opts)
keymap.set("n", "sj", '<Cmd>call VSCodeNotify("workbench.action.focusBelowGroup")<CR>', opts)
keymap.set("n", "sl", '<Cmd>call VSCodeNotify("workbench.action.focusRightGroup")<CR>', opts)

keymap.set("n", "<leader>jr", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], { desc = "Global Rename with Confirm" })
keymap.set("n", "<leader>jR", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Global Rename without Confirm" })

keymap.set("n", "<leader>ux", "<cmd>undolist<CR>", { desc = "Show undo list" })
keymap.set("n", "<leader>u2", "<cmd>earlier 1m<CR>", { desc = "Back 1 minute" })
keymap.set("n", "<leader>u6", "<cmd>earlier 5m<CR>", { desc = "Back 5 minutes" })

keymap.set("n", "<leader>jn", '<Cmd>call VSCodeNotify("editor.action.marker.next")<CR>', { desc = "Next diagnostic" })
keymap.set(
	"n",
	"<leader>jN",
	'<Cmd>call VSCodeNotify("editor.action.marker.prev")<CR>',
	{ desc = "Previous diagnostic" }
)
keymap.set("n", "<leader>jj", '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>', { desc = "Show diagnostic" })

keymap.set("n", "<C-p>", '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', { desc = "File search" })
keymap.set("n", ";f", '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', { desc = "File search" })
keymap.set(
	"n",
	"<leader><leader>",
	'<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>',
	{ desc = "File search" }
)

keymap.set("n", ";r", '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>', { desc = "Live grep" })

keymap.set("n", "<C-h>", '<Cmd>call VSCodeNotify("workbench.action.navigateLeft")<CR>', { desc = "Navigate left" })
keymap.set("n", "<C-j>", '<Cmd>call VSCodeNotify("workbench.action.navigateDown")<CR>', { desc = "Navigate down" })
keymap.set("n", "<C-k>", '<Cmd>call VSCodeNotify("workbench.action.navigateUp")<CR>', { desc = "Navigate up" })
keymap.set("n", "<C-l>", '<Cmd>call VSCodeNotify("workbench.action.navigateRight")<CR>', { desc = "Navigate right" })

--------------------------------------------------
-- Folding (VSCode)
--------------------------------------------------

-- Fold / unfold at cursor
keymap.set("n", "zc", '<Cmd>call VSCodeNotify("editor.fold")<CR>', { desc = "Fold at cursor" })
keymap.set("n", "zo", '<Cmd>call VSCodeNotify("editor.unfold")<CR>', { desc = "Unfold at cursor" })
keymap.set("n", "za", '<Cmd>call VSCodeNotify("editor.toggleFold")<CR>', { desc = "Toggle fold" })

-- Fold / unfold recursively
keymap.set("n", "zC", '<Cmd>call VSCodeNotify("editor.foldRecursively")<CR>', { desc = "Fold recursively" })
keymap.set("n", "zO", '<Cmd>call VSCodeNotify("editor.unfoldRecursively")<CR>', { desc = "Unfold recursively" })

-- Fold / unfold all
keymap.set("n", "zM", '<Cmd>call VSCodeNotify("editor.foldAll")<CR>', { desc = "Fold all" })
keymap.set("n", "zR", '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>', { desc = "Unfold all" })

-- Fold by level (1–5)
keymap.set("n", "<leader>z1", '<Cmd>call VSCodeNotify("editor.foldLevel1")<CR>', { desc = "Fold level 1" })
keymap.set("n", "<leader>z2", '<Cmd>call VSCodeNotify("editor.foldLevel2")<CR>', { desc = "Fold level 2" })
keymap.set("n", "<leader>z3", '<Cmd>call VSCodeNotify("editor.foldLevel3")<CR>', { desc = "Fold level 3" })
keymap.set("n", "<leader>z4", '<Cmd>call VSCodeNotify("editor.foldLevel4")<CR>', { desc = "Fold level 4" })
keymap.set("n", "<leader>z5", '<Cmd>call VSCodeNotify("editor.foldLevel5")<CR>', { desc = "Fold level 5" })

--------------------------------------------------
-- Clear search highlight
--------------------------------------------------

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
