return {
  "max397574/better-escape.nvim",
  event = "InsertCharPre",
  opts = {
    timeout = 300,
    mapping = { "jk" }, -- you can add more sequences like "jj"
    keys = function()
      return vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
    end,
  },
}
