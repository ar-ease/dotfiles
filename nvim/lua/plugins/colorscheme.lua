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
          -- keywords = { "italic" }, -- Italicize keywords
          strings = {}, -- Add any style to strings here
          variables = {}, -- Add any style to variables here
        },
        -- Custom highlight groups to differentiate unused code from comments
        custom_highlights = function(colors)
          return {
            -- Core syntax — anchored around mint string (#99FDE4)
            Comment    = { fg = "#5c6477", style = { "italic" } },
            Function   = { fg = "#8aadf4", style = { "bold" } },   -- catppuccin blue
            Keyword    = { fg = "#c6a0f6" },                        -- catppuccin mauve (softer purple)
            String     = { fg = "#99FDE4" },                        -- mint teal — unchanged
            Variable   = { fg = "#eed49f" },                        -- sage green
            Identifier = { fg = "#7dc4e4" },                        -- catppuccin sapphire (distinct from Function)
            Type       = { fg = "#f5a97f" },                        -- catppuccin peach
            Operator   = { fg = "#91d7e3" },                        -- catppuccin sky

            -- Treesitter overrides
            ["@parameter"]       = { fg = "#f4a8c7" },             -- soft pink (was hot #ff8d8d)
            ["@keyword"]         = { fg = "#c6a0f6" },
            ["@function"]        = { fg = "#8aadf4", style = { "bold" } },
            ["@function.call"]   = { fg = "#8aadf4" },
            ["@variable"]        = { fg = "#eed49f" },
            ["@type"]            = { fg = "#f5a97f" },
            ["@string"]          = { fg = "#99FDE4" },
            ["@number"]          = { fg = "#f5a97f" },
            ["@boolean"]         = { fg = "#c6a0f6", style = { "italic" } },
            ["@property"]        = { fg = "#7dc4e4" },              -- sapphire for object keys
            ["@tag.attribute"]   = { fg = "#a0b8d0" },              -- powder blue for className, id, href

            -- Unused code — unified muted overlay color with strikethrough
            DiagnosticUnnecessary  = { fg = "#6e738d", style = { "italic", "strikethrough" } },
            DiagnosticDeprecated   = { fg = "#6e738d", style = { "italic", "strikethrough" } },
            ["@variable.unused"]   = { fg = "#6e738d", style = { "italic" } },
            ["@import.unused"]     = { fg = "#6e738d", style = { "italic" } },
            ["@function.unused"]   = { fg = "#6e738d", style = { "italic" } },
            ["@parameter.unused"]  = { fg = "#6e738d", style = { "italic" } },

            -- Inlay hints — very dim, barely there
            LspInlayHint = { fg = "#494d64", style = { "italic" } },

            -- Diagnostic virtual text — dimmed, non-distracting
            DiagnosticVirtualTextHint  = { fg = "#4a4a5e", style = { "italic" } },
            DiagnosticVirtualTextInfo  = { fg = "#3d4a52", style = { "italic" } },
            DiagnosticVirtualTextWarn  = { fg = "#5c4a2a", style = { "italic" } },
            DiagnosticVirtualTextError = { fg = "#5c2a2a", style = { "italic" } },
            DiagnosticHint = { fg = "#4a4a5e" },

            -- Spell
            SpellBad = { fg = "#ed8796", style = { "undercurl" } },
            SpellCap = { fg = "#f0c6c6", style = { "undercurl" } },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")

      vim.diagnostic.config({
        virtual_text = {
          prefix = "·", -- single dimmed dot instead of ••
          spacing = 2,
          severity_sort = true,
        },
      })
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
