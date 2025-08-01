-- ~/.config/nvim/lua/plugins/tmux-navigator.lua

return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Go to left window" },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Go to lower window" },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Go to upper window" },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Go to right window" },
  },
}
