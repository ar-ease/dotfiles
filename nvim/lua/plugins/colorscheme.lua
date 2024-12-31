

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- Choose from latte, frappe, macchiato, mocha
				transparent_background = true,
				term_colors = true,
				styles = {
					comments = { "italic" },
					functions = { "bold" },
					keywords = { "italic" },
					strings = {},
					variables = {},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
-- return {

-- 	{
-- 		"sainnhe/sonokai",
-- 		priority = 1000,
-- 		config = function()
-- 			vim.g.sonokai_transparent_background = "1"
-- 			vim.g.sonokai_enable_italic = "1"
-- 			vim.g.sonokai_style = "andromeda"
-- 			vim.cmd.colorscheme("sonokai")
-- 		end,
-- 	},
-- }
