return {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
  opts = {
    timeout = 300,
    mapping = { "jk" },
    keys = "<Esc>",
    clear_empty_lines = false, -- Added missing option
  },
}
