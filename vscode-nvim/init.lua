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

if vim.g.vscode then
	-- undo/REDO via vscode
	vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
	vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")
end

vim.keymap.set("n", "'", ";")

keymap.set("i", "<CR>", "<CR><C-g>u", { noremap = true, expr = false })
-- Preserve default f and s commands
keymap.set("n", "f", "f", { noremap = true })
keymap.set("n", "s", "s", { noremap = true })

keymap.set("n", "x", '"_x', opts)
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

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

keymap.set("n", "<leader>sq", 'ciw"<C-r>""<Esc>', { desc = "Surround word with quotes" })
keymap.set("n", "<leader>s'", "ciw'<C-r>\"'<Esc>", { desc = "Surround word with single quotes" })
keymap.set("n", "<leader>s(", 'ciw(<C-r>")<Esc>', { desc = "Surround word with parentheses" })
keymap.set("n", "<leader>s[", 'ciw[<C-r>"]<Esc>', { desc = "Surround word with brackets" })
keymap.set("n", "<leader>s{", 'ciw{<C-r>"}<Esc>', { desc = "Surround word with braces" })

keymap.set("v", "<leader>q", 'c"<C-r>""<Esc>', { desc = "Surround selection with quotes" })
keymap.set("v", "<leader>'", "c'<C-r>\"'<Esc>", { desc = "Surround selection with single quotes" })
keymap.set("v", "<leader>(", 'c(<C-r>")<Esc>', { desc = "Surround selection with parentheses" })
keymap.set("v", "<leader>[", 'c[<C-r>"]<Esc>', { desc = "Surround selection with brackets" })
keymap.set("v", "<leader>{", 'c{<C-r>"}<Esc>', { desc = "Surround selection with braces" })

-- Vim-surround style mappings (simplified and working)
-- Add surrounds: ysiw" (surround inner word with quotes)
keymap.set("n", 'ysiw"', 'viw<Esc>`<i"<Esc>`>la"<Esc>', { desc = "Surround inner word with quotes" })
keymap.set("n", "ysiw'", "viw<Esc>`<i'<Esc>`>la'<Esc>", { desc = "Surround inner word with single quotes" })
keymap.set("n", "ysiw(", "viw<Esc>`<i(<Esc>`>la)<Esc>", { desc = "Surround inner word with parentheses" })
keymap.set("n", "ysiw)", "viw<Esc>`<i(<Esc>`>la)<Esc>", { desc = "Surround inner word with parentheses" })
keymap.set("n", "ysiw[", "viw<Esc>`<i[<Esc>`>la]<Esc>", { desc = "Surround inner word with brackets" })
keymap.set("n", "ysiw]", "viw<Esc>`<i[<Esc>`>la]<Esc>", { desc = "Surround inner word with brackets" })
keymap.set("n", "ysiw{", "viw<Esc>`<i{<Esc>`>la}<Esc>", { desc = "Surround inner word with braces" })
keymap.set("n", "ysiw}", "viw<Esc>`<i{<Esc>`>la}<Esc>", { desc = "Surround inner word with braces" })
keymap.set("n", "ysiw<", "viw<Esc>`<i<<Esc>`>la><Esc>", { desc = "Surround inner word with angle brackets" })
keymap.set("n", "ysiw>", "viw<Esc>`<i<<Esc>`>la><Esc>", { desc = "Surround inner word with angle brackets" })
keymap.set("n", "ysiw`", "viw<Esc>`<i`<Esc>`>la`<Esc>", { desc = "Surround inner word with backticks" })

-- Delete surrounds: ds" (delete surrounding quotes)
keymap.set("n", 'ds"', 'F"xf"x', { desc = "Delete surrounding quotes" })
keymap.set("n", "ds'", "F'xf'x", { desc = "Delete surrounding single quotes" })
keymap.set("n", "ds(", "F(xf)x", { desc = "Delete surrounding parentheses" })
keymap.set("n", "ds)", "F(xf)x", { desc = "Delete surrounding parentheses" })
keymap.set("n", "ds[", "F[xf]x", { desc = "Delete surrounding brackets" })
keymap.set("n", "ds]", "F[xf]x", { desc = "Delete surrounding brackets" })
keymap.set("n", "ds{", "F{xf}x", { desc = "Delete surrounding braces" })
keymap.set("n", "ds}", "F{xf}x", { desc = "Delete surrounding braces" })
keymap.set("n", "ds<", "F<xf>x", { desc = "Delete surrounding angle brackets" })
keymap.set("n", "ds>", "F<xf>x", { desc = "Delete surrounding angle brackets" })
keymap.set("n", "ds`", "F`xf`x", { desc = "Delete surrounding backticks" })

-- Change surrounds: cs"' (change quotes to single quotes)
keymap.set("n", "cs\"'", "F\"r'f\"r'", { desc = "Change double quotes to single quotes" })
keymap.set("n", "cs'\"", "F'r\"f'r\"", { desc = "Change single quotes to double quotes" })
keymap.set("n", 'cs"(', 'F"r(f"r)', { desc = "Change quotes to parentheses" })
keymap.set("n", 'cs"[', 'F"r[f"r]', { desc = "Change quotes to brackets" })
keymap.set("n", 'cs"{', 'F"r{f"r}', { desc = "Change quotes to braces" })
keymap.set("n", "cs([", "F(r[f)r]", { desc = "Change parentheses to brackets" })
keymap.set("n", "cs({", "F(r{f)r}", { desc = "Change parentheses to braces" })
keymap.set("n", "cs[{", "F[r{f]r}", { desc = "Change brackets to braces" })

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
