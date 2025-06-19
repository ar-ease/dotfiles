-- Main color scheme with differentiated unused code and comments
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
        -- Custom highlight groups to differentiate unused code from comments
        custom_highlights = {
          -- Comments - keep your current grey color
          Comment = { fg = "#6c757d", italic = true },

          -- Regular code highlighting (your existing setup)
          Function = { fg = "#82aaff", bold = true },
          Keyword = { fg = "#d677f2" },
          String = { fg = "#f87b9b" },
          Variable = { fg = "#d19a66" },
          Identifier = { fg = "#82aaff" },
          Type = { fg = "#f2d17e" },
          ["@parameter"] = { fg = "#ff8d8d" },

          -- Unused code - brighter gray for better visibility but still subtle
          DiagnosticUnnecessary = { fg = "#8a8a8a", italic = true, strikethrough = true },
          DiagnosticDeprecated = { fg = "#7a7a7a", italic = true, strikethrough = true },

          -- LSP unused variables/imports - lighter gray, easier to spot
          ["@variable.unused"] = { fg = "#7d7d7d", italic = true },
          ["@import.unused"] = { fg = "#7d7d7d", italic = true },
          ["@function.unused"] = { fg = "#7d7d7d", italic = true },

          -- Inlay hints (if you use them) - keep subtle
          LspInlayHint = { fg = "#505050", italic = true },

          -- Make unused parameters brighter gray
          ["@parameter.unused"] = { fg = "#7a7a7a", italic = true },

          -- Spell checking (often confused with unused code)
          SpellBad = { fg = "#f87171", undercurl = true },
          SpellCap = { fg = "#fbbf24", undercurl = true },
        },
      })
      vim.cmd.colorscheme("catppuccin") -- Set the colorscheme to catppuccin
    end,
  },
}
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
