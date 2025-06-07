return {
  "max397574/better-escape.nvim",
  opts = {
    mapping = { "jk" }, -- you can also use "jj" or other combos
    timeout = 300, -- time in ms to wait for escape sequence
    clear_empty_lines = false,
    keys = "<Esc>", -- keys to send after escape
  },
}
