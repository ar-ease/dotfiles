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
-- ESSENTIAL ADDITIONS
-- ===========================

-- Better escape sequences
keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- Clear search highlighting
keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Better indenting (maintains selection)
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines up/down in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ===========================
-- VS CODE SPECIFIC SHORTCUTS
-- ===========================

-- Command palette
keymap.set(
	"n",
	"<leader>p",
	'<Cmd>call VSCodeNotify("workbench.action.showCommands")<CR>',
	{ desc = "Command Palette" }
)

-- Format document
keymap.set(
	"n",
	"<leader>lf",
	'<Cmd>call VSCodeNotify("editor.action.formatDocument")<CR>',
	{ desc = "Format Document" }
)

-- Rename symbol
keymap.set("n", "<leader>lr", '<Cmd>call VSCodeNotify("editor.action.rename")<CR>', { desc = "Rename Symbol" })

-- Go to definition
keymap.set("n", "gd", '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>', { desc = "Go to Definition" })

-- Go to references
keymap.set("n", "gr", '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>', { desc = "Go to References" })

-- Terminal operations
keymap.set(
	"n",
	"<C-`>",
	'<Cmd>call VSCodeNotify("workbench.action.terminal.toggleTerminal")<CR>',
	{ desc = "Toggle Terminal" }
)
keymap.set(
	"n",
	"<leader>tt",
	'<Cmd>call VSCodeNotify("workbench.action.terminal.focus")<CR>',
	{ desc = "Focus Terminal" }
)

-- Git operations
keymap.set("n", "<leader>gg", '<Cmd>call VSCodeNotify("workbench.view.scm")<CR>', { desc = "Source Control" })
keymap.set("n", "<leader>gb", '<Cmd>call VSCodeNotify("gitlens.toggleFileBlame")<CR>', { desc = "Toggle Git Blame" })

-- Quick navigation shortcuts
keymap.set("n", "<leader>h", '<Cmd>call VSCodeNotify("workbench.view.explorer")<CR>', { desc = "Focus Explorer" })
keymap.set(
	"n",
	"<leader>j",
	'<Cmd>call VSCodeNotify("workbench.action.terminal.focus")<CR>',
	{ desc = "Focus Terminal" }
)
keymap.set(
	"n",
	"<leader>k",
	'<Cmd>call VSCodeNotify("workbench.action.showCommands")<CR>',
	{ desc = "Command Palette" }
)
keymap.set(
	"n",
	"<leader>l",
	'<Cmd>call VSCodeNotify("workbench.action.focusActiveEditorGroup")<CR>',
	{ desc = "Focus Editor" }
)

-- ===========================
-- AUTO-COMMANDS
-- ===========================

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text briefly",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})
