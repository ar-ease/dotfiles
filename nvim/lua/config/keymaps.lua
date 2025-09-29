---@diagnostic disable: undefined-global
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Ensure Shift+; (:) always opens the command-line
keymap.set({ "n", "v" }, ":", ":", { noremap = true, silent = false })

keymap.set("n", "x", '"_x')
keymap.set("n", "H", "<cmd>normal! H<cr>", opts)
keymap.set("n", "L", "<cmd>normal! L<cr>", opts)
keymap.del("n", "<Tab>")
-- Insert-mode undo breakpoints
keymap.set("i", ",", ",<C-g>u", opts)
keymap.set("i", ".", ".<C-g>u", opts)
keymap.set("i", "!", "!<C-g>u", opts)
keymap.set("i", "?", "?<C-g>u", opts)
keymap.set("i", " ", " <C-g>u", opts)
keymap.set("i", "<CR>", "<CR><C-g>u", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "<leader>jr", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], { desc = "Global Rename with Confirm" })
keymap.set("n", "<leader>jR", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Global Rename without Confirm" })

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize
vim.keymap.set("n", "<A-h>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<A-l>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<A-j>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<A-k>", ":resize +2<CR>", opts)
-- keymap.set("n", "<C-S-h>", "<C-w><")
-- keymap.set("n", "<C-S-l>", "<C-w>>")
-- keymap.set("n", "<C-S-k>", "<C-w>+")
-- keymap.set("n", "<C-S-j>", "<C-w>-")

-- Tmux Navigator (seamless navigation between tmux and nvim)
-- Note: Ctrl+H, Ctrl+J, Ctrl+K, Ctrl+L will work automatically via the tmux-navigator plugin
-- No manual tmux commands needed anymore

-- Undolist
keymap.set("n", "<leader>ux", ":undolist<CR>", { desc = "Show undo list" })
keymap.set("n", "<leader>u2", ":earlier 1m<CR>", { desc = "Back 1 minute" })
keymap.set("n", "<leader>u6", ":earlier 5m<CR>", { desc = "Back 5 minutes" })

-- Authenticate Copilot
keymap.set("n", "<leader>ns", ":Copilot auth<CR>", opts)

-- Diagnostics (updated syntax for newer Neovim)
keymap.set("n", "<leader>jn", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
keymap.set("n", "<leader>jN", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
keymap.set("n", "<leader>jj", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostic" })
