-- ~/.config/nvim/lua/plugins/presence.lua
return {
  "andweeb/presence.nvim",
  config = function()
    require("presence"):setup({
      -- General options
      auto_update = true,  -- Update activity based on changes in Neovim
      neovim_image_text = "Editing with Neovim", -- Text displayed under your Discord profile
      main_image = "neovim",  -- Main image to be displayed ("neovim", "file", or custom image)
      
      -- Rich Presence text options
      editing_text = "Editing %s", -- Editing message format, %s will be the filename
      file_explorer_text = "Browsing %s", -- Message when browsing in file explorer (like netrw, nvim-tree, etc.)
      reading_text = "Reading %s", -- Message when in a read-only or preview mode
      workspace_text = "Working on Something :)", -- Message when in a workspace (project) directory

      -- Customize how long to wait before updating status (in seconds)
      debounce_timeout = 10,
    })
  end,
}