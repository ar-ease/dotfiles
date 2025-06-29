-- Complete VS Code Neovim Configuration
-- This file only affects Neovim when used inside VS Code

-- ===========================
-- CORE SETUP
-- ===========================
vim.g.vscode = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic optimizations
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"

-- ===========================
-- PLUGIN SETUP (Surround)
-- ===========================
-- Bootstrap lazy.nvim if not already present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "ys",
					normal_cur = "yss",
					normal_line = "yS",
					normal_cur_line = "ySS",
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
					change_line = "cS",
				},
			})
		end,
	},
})

-- ===========================
-- HELPER FUNCTIONS
-- ===========================
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ===========================
-- YOUR ORIGINAL KEYBINDS (All working)
-- ===========================

-- Basic editing
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Save and quit (VS Code adapted)
keymap.set("n", "<Leader>w", '<Cmd>call VSCodeNotify("workbench.action.files.save")<CR>', opts)
keymap.set("n", "<Leader>q", '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>', opts)
keymap.set("n", "<Leader>Q", '<Cmd>call VSCodeNotify("workbench.action.closeAllEditors")<CR>', opts)

-- File explorer (VS Code adapted)
keymap.set("n", "<Leader>f", '<Cmd>call VSCodeNotify("revealInExplorer")<CR>', opts)
keymap.set("n", "<Leader>t", '<Cmd>call VSCodeNotify("workbench.view.explorer")<CR>', opts)

-- Tabs (VS Code adapted)
keymap.set("n", "te", '<Cmd>call VSCodeNotify("workbench.action.files.newUntitledFile")<CR>', opts)
keymap.set("n", "<tab>", '<Cmd>call VSCodeNotify("workbench.action.nextEditor")<CR>', opts)
keymap.set("n", "<s-tab>", '<Cmd>call VSCodeNotify("workbench.action.previousEditor")<CR>', opts)
keymap.set("n", "tw", '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>', opts)

-- Split window (VS Code adapted)
keymap.set("n", "ss", '<Cmd>call VSCodeNotify("workbench.action.splitEditorDown")<CR>', opts)
keymap.set("n", "sv", '<Cmd>call VSCodeNotify("workbench.action.splitEditorRight")<CR>', opts)

-- Global find and replace (native vim - works perfectly)
keymap.set("n", "<leader>jr", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], { desc = "Global Rename with Confirm" })
keymap.set("n", "<leader>jR", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Global Rename without Confirm" })

-- Window navigation (VS Code adapted - FIXED)
keymap.set("n", "sh", '<Cmd>call VSCodeNotify("workbench.action.focusLeftGroup")<CR>', opts)
keymap.set("n", "sk", '<Cmd>call VSCodeNotify("workbench.action.focusAboveGroup")<CR>', opts)
keymap.set("n", "sj", '<Cmd>call VSCodeNotify("workbench.action.focusBelowGroup")<CR>', opts)
keymap.set("n", "sl", '<Cmd>call VSCodeNotify("workbench.action.focusRightGroup")<CR>', opts)

-- Resize window (VS Code adapted)
keymap.set("n", "<C-S-h>", '<Cmd>call VSCodeNotify("workbench.action.decreaseViewWidth")<CR>', opts)
keymap.set("n", "<C-S-l>", '<Cmd>call VSCodeNotify("workbench.action.increaseViewWidth")<CR>', opts)
keymap.set("n", "<C-S-k>", '<Cmd>call VSCodeNotify("workbench.action.increaseViewHeight")<CR>', opts)
keymap.set("n", "<C-S-j>", '<Cmd>call VSCodeNotify("workbench.action.decreaseViewHeight")<CR>', opts)

-- Undo operations (native vim - works perfectly)
keymap.set("n", "<leader>ux", ":undolist<CR>", { desc = "Show undo list" })
keymap.set("n", "<leader>u2", ":earlier 1m<CR>", { desc = "Back 1 minute" })
keymap.set("n", "<leader>u6", ":earlier 5m<CR>", { desc = "Back 5 minutes" })

-- Copilot (VS Code adapted)
keymap.set("n", "<leader>ns", '<Cmd>call VSCodeNotify("github.copilot.signIn")<CR>', opts)

-- Diagnostics (VS Code adapted)
keymap.set("n", "<leader>jn", '<Cmd>call VSCodeNotify("editor.action.marker.next")<CR>', { desc = "Next diagnostic" })
keymap.set(
	"n",
	"<leader>jN",
	'<Cmd>call VSCodeNotify("editor.action.marker.prev")<CR>',
	{ desc = "Previous diagnostic" }
)
keymap.set("n", "<leader>jj", '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>', { desc = "Show diagnostic" })

-- ===========================
-- NEW KEYBINDS (Your requests)
-- ===========================

-- File search (multiple options)
keymap.set("n", ";f", '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', { desc = "File search" })
keymap.set(
	"n",
	"<leader><leader>",
	'<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>',
	{ desc = "File search" }
)

-- Live grep
keymap.set("n", ";e", '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>', { desc = "Live grep" })

-- FIXED: Panel navigation (Ctrl+hjkl)
keymap.set("n", "<C-h>", '<Cmd>call VSCodeNotify("workbench.action.navigateLeft")<CR>', { desc = "Navigate left" })
keymap.set("n", "<C-j>", '<Cmd>call VSCodeNotify("workbench.action.navigateDown")<CR>', { desc = "Navigate down" })
keymap.set("n", "<C-k>", '<Cmd>call VSCodeNotify("workbench.action.navigateUp")<CR>', { desc = "Navigate up" })
keymap.set("n", "<C-l>", '<Cmd>call VSCodeNotify("workbench.action.navigateRight")<CR>', { desc = "Navigate right" })

-- ===========================
-- SURROUND KEYBINDS (Added)
-- ===========================

-- Surround operations (nvim-surround plugin handles most of this automatically)
-- These are the default keybinds that will work:
-- ys{motion}{char} - Add surround around motion (e.g., ysiw" to surround inner word with quotes)
-- yss{char} - Add surround around entire line (e.g., yss) to surround line with parentheses)
-- ds{char} - Delete surround (e.g., ds" to delete surrounding quotes)
-- cs{old}{new} - Change surround (e.g., cs"' to change quotes to single quotes)
-- S{char} - Add surround in visual mode

-- Quick surround shortcuts for common cases
keymap.set("n", "<leader>sq", 'ysiw"', { desc = "Surround word with quotes" })
keymap.set("n", "<leader>s'", "ysiw'", { desc = "Surround word with single quotes" })
keymap.set("n", "<leader>s(", "ysiw)", { desc = "Surround word with parentheses" })
keymap.set("n", "<leader>s[", "ysiw]", { desc = "Surround word with brackets" })
keymap.set("n", "<leader>s{", "ysiw}", { desc = "Surround word with braces" })
keymap.set("n", "<leader>s<", "ysiw>", { desc = "Surround word with angle brackets" })

-- Visual mode surround shortcuts
keymap.set("v", "<leader>q", 'S"', { desc = "Surround selection with quotes" })
keymap.set("v", "<leader>'", "S'", { desc = "Surround selection with single quotes" })
keymap.set("v", "<leader>(", "S)", { desc = "Surround selection with parentheses" })
keymap.set("v", "<leader>[", "S]", { desc = "Surround selection with brackets" })
keymap.set("v", "<leader>{", "S}", { desc = "Surround selection with braces" })
keymap.set("v", "<leader><", "S>", { desc = "Surround selection with angle brackets" })

-- ===========================
-- ESSENTIAL ADDITIONS
-- ===========================

-- Better escape sequences
keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- Clear search
