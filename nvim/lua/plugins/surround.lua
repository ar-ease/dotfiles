return {
  "kylechui/nvim-surround",
  version = "*", -- use the latest version
  event = VeryLazy, -- load lazily
  config = function()
    require("nvim-surround").setup({})
  end,
}
