local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "catppuccin",  -- Change from sonokai to catppuccin
        news = {
          lazyvim = true,
          neovim = true,
        },
      },
    },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "plugins" },

    -- Add the catppuccin plugin to the setup
    -- {
    --   "catppuccin/nvim",
    --   config = function()
    --     require("catppuccin").setup({
    --       flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
    --       transparent_background = true, -- To make the background transparent
    --     })
    --     vim.cmd.colorscheme("catppuccin") -- Set the colorscheme to catppuccin
    --   end,
    -- },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  dev = {
    path = "~/.ghq/github.com",
  },
  checker = { enabled = true },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
})