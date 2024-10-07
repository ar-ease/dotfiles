-- ~/.config/nvim/lua/plugins/neotree.lua

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = true,      -- Hide dotfiles (optional, as per your preference)
        hide_gitignored = true,    -- Hide files mentioned in .gitignore
        hide_by_name = {           -- Optional: additional file names to hide
          -- Add file patterns or specific files to hide, e.g. "node_modules"
        },
        never_show = {             -- Ensure these files always remain visible
          ".gitignore",            -- Keep the .gitignore file visible even if hiding based on it
        },
      },
      follow_current_file = true,  -- Focus on the current file in the tree
    },
  },
}