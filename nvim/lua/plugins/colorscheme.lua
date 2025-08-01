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
        custom_highlights = function(colors)
          return {
            -- Comments - keep your current grey color
            Comment = { fg = "#6c757d", style = { "italic" } },
            -- Regular code highlighting (your existing setup)
            Function = { fg = "#82aaff", style = { "bold" } },
            Keyword = { fg = "#d677f2" },
            String = { fg = "#f5e0dc" },
            -- String = { fg = "#e5c07b" },
            Variable = { fg = "#d19a66" },
            Identifier = { fg = "#82aaff" },
            Type = { fg = "#fab387" },
            ["@parameter"] = { fg = "#ff8d8d" },
            -- Unused code - brighter gray for better visibility but still subtle
            DiagnosticUnnecessary = { fg = "#8a8a8a", style = { "italic", "strikethrough" } },
            DiagnosticDeprecated = { fg = "#7a7a7a", style = { "italic", "strikethrough" } },
            -- LSP unused variables/imports - lighter gray, easier to spot
            ["@variable.unused"] = { fg = "#7d7d7d", style = { "italic" } },
            ["@import.unused"] = { fg = "#7d7d7d", style = { "italic" } },
            ["@function.unused"] = { fg = "#7d7d7d", style = { "italic" } },
            -- Inlay hints (if you use them) - keep subtle
            LspInlayHint = { fg = "#505050", style = { "italic" } },
            -- Make unused parameters brighter gray
            ["@parameter.unused"] = { fg = "#7a7a7a", style = { "italic" } },
            -- Spell checking (often confused with unused code)
            SpellBad = { fg = "#f87171", style = { "undercurl" } },
            SpellCap = { fg = "#fbbf24", style = { "undercurl" } },
            -- Additional useful highlights
            -- ["@variable.builtin"] = { fg = colors.red, style = { "italic" } },
            -- ["@constant.builtin"] = { fg = colors.peach },
            -- ["@type.builtin"] = { fg = colors.yellow, style = { "italic" } },
          }
        end,
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
-- return {
--   "datsfilipe/vesper.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("vesper").setup({
--       transparent = false, -- or true
--       italics = {
--         comments = true,
--         keywords = true,
--         functions = true,
--         strings = true,
--         variables = true,
--       },
--     })
--     vim.cmd([[colorscheme vesper]])
--   end,
-- }
