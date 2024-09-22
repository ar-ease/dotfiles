if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

-- Add Treesitter configuration
require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "javascript", "java", "c", "lua", "python", "bash" }, -- Include your languages
	highlight = {
		enable = true,
	},
})

print("Treesitter setup complete")

