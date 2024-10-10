local keymap = vim.keymap
local opts = { noremap = true, silent = true }


keymap.set("n", "x", '"_x')
--autosave
keymap.set("n", "<leader>na", ":ASToggle<CR>", opts)
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

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

--for tmux
keymap.set("n", "<leader>hh", ":!tmux select-pane -L<CR>")  -- Move to the left pane
keymap.set("n", "<leader>hl", ":!tmux select-pane -R<CR>")  -- Move to the right pane
keymap.set("n", "<leader>hj", ":!tmux select-pane -D<CR>")  -- Move down
keymap.set("n", "<leader>hk", ":!tmux select-pane -U<CR>")  -- Move up


--copilot keymaps
-- Enable Copilot
keymap.set("n", "<leader>ne", ":Copilot enable<CR>", opts) 

-- Disable Copilot
keymap.set("n", "<leader>nd", ":Copilot disable<CR>", opts) 

-- Authenticate Copilot
keymap.set("n", "<leader>ns", ":Copilot auth<CR>", opts)   

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)
