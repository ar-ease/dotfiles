return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          tailwind = true,
          css = true,
          mode = "background",
        },
      })
    end,
  },
}
