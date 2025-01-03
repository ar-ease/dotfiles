-- return {
--   {
--     "catppuccin/nvim",
--     priority = 1000, -- Ensure it loads early
--     config = function()
--       local catppuccin = require("catppuccin")

--       -- Customizing the theme
--       catppuccin.setup({
--         flavour = "macchiato", -- Choose the flavour: latte, frappe, macchiato, mocha
--         transparent_background = true, -- Enable transparent background
--         term_colors = true, -- Enable terminal colors
--         styles = {
--           comments = "italic",  -- Italicize comments
--           functions = "bold",   -- Bold functions
--           keywords = "italic",  -- Italicize keywords
--           strings = "NONE",     -- Keep strings normal (no special styling)
--           variables = "NONE",   -- No special styling for variables
--         },
--         custom_highlights = {
--           Comment = { fg = "#6A6A6A", italic = true },  -- Greyish comments
--           String = { fg = "#A8C080" },                   -- Light green for strings
--           Function = { fg = "#F0C674", bold = true },    -- Yellow functions
--           Keyword = { fg = "#C678DD", italic = true },   -- Purple keywords
--           Variable = { fg = "#E6B5A5" },                 -- Soft peach for variables
--           Identifier = { fg = "#F8F8F2" },               -- White for identifiers
--           Constant = { fg = "#F8F8F2" },                 -- White for constants
--           Number = { fg = "#D19A66" },                   -- Amber numbers
--           Operator = { fg = "#C5C8C6" },                 -- Light gray for operators
--           Type = { fg = "#F8F8F2" },                     -- White for types
--         },
--       })

--       -- Apply the colorscheme
--       vim.cmd.colorscheme("catppuccin")
--     end,
--   },
-- }
-- return {

--   {
--     "projekt0n/github-nvim-theme",
--     priority = 1000, -- Ensure it loads early
--     config = function()
--       require("github-theme").setup({
--         options = {
--           transparent = true, -- Enable transparent background
--           styles = {
--             comments = "italic", -- Italicize comments
--             functions = "bold", -- Bold functions
--             keywords = "italic", -- Italicize keywords
--           },
--         },
--         groups = {
--           all = {
--             -- Transparent background for Normal and Float windows
--             Normal = { bg = "NONE" },
--             NormalFloat = { bg = "NONE" },
--             -- Customize specific highlights
-- 		 Comment = { fg = "#A0A0A0" }, -- Greyish comment color
--            -- String = { fg = "#98C379" },  -- Good, noticeable string color	
--           },
--         },
--       })

--       -- Apply the colorscheme
--       vim.cmd.colorscheme("github_dark_default") -- Options: github_dark, github_dark_default, etc.
--     end,
--   },
-- }
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
          comments = { "italic" }, -- Italicize comments
          functions = { "bold" }, -- Bold functions
          keywords = { "italic" }, -- Italicize keywords
          strings = {}, -- Add any style to strings here
          variables = {}, -- Add any style to variables here
        },
        -- Custom highlight groups to change the colors of certain elements
        custom_highlights = {
          Comment = { fg = "#6c757d", italic = true }, -- Change comment color to grey
          Function = { fg = "#82aaff", bold = true }, -- Bold blue functions
          Keyword = { fg = "#c678dd", italic = true }, -- Purple keywords
          String = { fg = "#98c379" }, -- Green strings
          Variable = { fg = "#d19a66" }, -- Yellow variables
        },
      })
      vim.cmd.colorscheme("catppuccin") -- Set the colorscheme to catppuccin
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
