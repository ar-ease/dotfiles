---@diagnostic disable: undefined-global
-- safe nvim-treesitter spec for Lazy
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- Defer setup to lazy.nvim via `main` + `opts` so it only runs when available
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c",
      "vue",
      "lua",
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
      "tsx", -- important
      "http",
      "json",
      "css",
      "scss",
      "graphql",
      "rust",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      -- Disable vim/vimdoc/query everywhere to avoid "Invalid node type 'substitute'" in recent updates
      disable = function(lang, buf)
        if lang == "vim" or lang == "vimdoc" or lang == "query" then
          return true
        end
        return false
      end,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    -- Never install problematic parsers until upstream fixes queries
    ignore_install = { "vim", "vimdoc", "query" },
    modules = {},
  },
}
