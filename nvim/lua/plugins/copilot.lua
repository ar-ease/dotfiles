return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      -- Add any other custom Copilot configurations here
    end,
  },
}
-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--       require("copilot").setup({
--         suggestion = {
--           enabled = true,
--           auto_trigger = true,
--           keymap = {
--             accept = "<C-j>", -- use Ctrl + j to accept suggestions
--           },
--         },
--         panel = { enabled = false },
--       })
--     end,
--   },
-- }
