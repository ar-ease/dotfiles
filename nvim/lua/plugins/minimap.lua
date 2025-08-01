return {
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  event = "VeryLazy",
  config = function()
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 0
    vim.g.minimap_auto_start_win_enter = 0
  end,
  keys = {
    { "<leader>mm", "<cmd>MinimapToggle<CR>", desc = "Toggle Minimap" },
  },
}
