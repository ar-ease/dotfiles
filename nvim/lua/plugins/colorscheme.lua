-- github
-- return {
--
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
--             Comment = { fg = "#A0A0A0" }, -- Greyish comment color
--             -- String = { fg = "#98C379" },  -- Good, noticeable string color
--           },
--         },
--       })
--
--       -- Apply the colorscheme
--       vim.cmd.colorscheme("github_dark_default") -- Options: github_dark, github_dark_default, etc.
--     end,
--   },
-- }
--
-- main color scheme
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
          --          Section = { fg = "#82aaff", bg = "#1e1e2e", bold = true }

          --default by gpt

          -- Comment = { fg = "#6c757d", italic = true }, -- Change comment color to grey
          -- Function = { fg = "#82aaff", bold = true }, -- Bold blue functions
          -- Keyword = { fg = "#c678dd", italic = true }, -- Purple keywords
          -- String = { fg = "#cfa935" }, -- Green strings
          -- -- String = { fg = "#98c379" }, -- Green strings
          -- Variable = { fg = "#d19a66" }, -- Yellow variables

          ---new
          Comment = { fg = "#6c757d", italic = true }, -- Change comment color to grey
          Function = { fg = "#82aaff", bold = true }, -- Bold blue functions
          Keyword = { fg = "#d677f2" }, -- Purple keywords
          --String = { fg = "#f87294" }, -- primary(redish)strings
          String = { fg = "#f87b9b" }, -- primary(redish)strings

          Variable = { fg = "#d19a66" }, -- Yellow variables
          Identifier = { fg = "#82aaff" }, -- Blue identifiers
          --   Constant = { fg = "#f78c6c" }, -- Orange constants
          --  Number = { fg = "#f36784" }, -- Orange numbers
          --   Operator = { fg = "#f78c6c" }, -- Orange operators
          Type = { fg = "#f2d17e" }, -- Orange types
          ["@parameter"] = { fg = "#ff8d8d" },
        },
      })
      vim.cmd.colorscheme("catppuccin") -- Set the colorscheme to catppuccin
    end,
  },
}
--
-- old color scheme
-- return {
--
--   {
--     "sainnhe/sonokai",
--     priority = 1000,
--     config = function()
--       vim.g.sonokai_transparent_background = "1"
--       vim.g.sonokai_enable_italic = "1"
--       vim.g.sonokai_style = "andromeda"
--       vim.cmd.colorscheme("sonokai")
--     end,
--   },
-- }
