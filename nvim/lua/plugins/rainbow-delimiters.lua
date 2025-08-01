-- return {
--   "HiPhish/rainbow-delimiters.nvim",
--   event = { "BufReadPost", "BufNewFile" },
--   config = function()
--     local rainbow_delimiters = require("rainbow-delimiters")
--
--     vim.g.rainbow_delimiters = {
--       strategy = {
--         [""] = rainbow_delimiters.strategy["global"],
--         vim = rainbow_delimiters.strategy["local"],
--       },
--       query = {
--         [""] = "rainbow-delimiters",
--         lua = "rainbow-blocks",
--         javascript = "rainbow-delimiters",
--         typescript = "rainbow-delimiters",
--         python = "rainbow-delimiters",
--         c = "rainbow-delimiters",
--         cpp = "rainbow-delimiters",
--         rust = "rainbow-delimiters",
--         go = "rainbow-delimiters",
--       },
--       highlight = {
--         "RainbowDelimiterGreen",
--         "RainbowDelimiterBlue",
--         "RainbowDelimiterOrange",
--         "RainbowDelimiterPurple",
--       },
--     }
--
--     -- Final custom colors
--     vim.cmd([[
--       highlight RainbowDelimiterGreen  guifg=#6fcf97
--       highlight RainbowDelimiterBlue   guifg=#56b6c2
--       highlight RainbowDelimiterOrange guifg=#d19a66
--       highlight RainbowDelimiterPurple guifg=#c678dd
--     ]])
--   end,
-- }
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        javascript = "rainbow-delimiters",
        typescript = "rainbow-delimiters",
        python = "rainbow-delimiters",
        c = "rainbow-delimiters",
        cpp = "rainbow-delimiters",
        rust = "rainbow-delimiters",
        go = "rainbow-delimiters",
      },
      highlight = {
        "RainbowDelimiterBlue",
        "RainbowDelimiterYellow",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
