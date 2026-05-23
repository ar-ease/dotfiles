return {
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  event = "VeryLazy",
  config = function()
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 0
    vim.g.minimap_auto_start_win_enter = 0

    vim.api.nvim_set_hl(0, "minimapFg", { fg = "#b0b0b0" })
    vim.api.nvim_set_hl(0, "minimapCursor", { fg = "#d0d0d0", bold = true })
    vim.api.nvim_set_hl(0, "minimapRange", { fg = "#c0c0c0" })
  end,
  keys = {
    { "<leader>mm", "<cmd>MinimapToggle<CR>", desc = "Toggle Minimap" },
  },
}
