-- Fix Ctrl+I for forward jump navigation
return {
  {
    "LazyVim/LazyVim",
    keys = {
      -- Restore Ctrl+I for forward jump navigation
      { "<C-i>", "<C-i>", desc = "Jump forward", mode = "n" },
    },
  },
}
