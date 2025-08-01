return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "vue",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "heex",
        "go",
        "javascript",
        "html",
        "python",
        "yaml",
        "xml",
        "ruby",
        "markdown",
        "cmake",
        "typescript",
        "http",
        "json",
        "css",
        "scss",
        "graphql",
        "rust",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ignore_install = {},
      modules = {},
    })
  end,
}

