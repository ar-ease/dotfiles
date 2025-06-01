return {
  "HiPhish/nvim-ts-rainbow2",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "python",
        "tsx",
        "jsx",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      rainbow = {
        enable = true,
        query = {
          "rainbow-parens",
          html = "rainbow-tags",
          tsx = "rainbow-tags",
        },
        strategy = {
          [""] = require("ts-rainbow.strategy.global"),
          html = require("ts-rainbow.strategy.global"),
          tsx = require("ts-rainbow.strategy.global"),
        },
      },
    })
  end,
}
