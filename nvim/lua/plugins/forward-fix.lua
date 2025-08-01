return {
  -- This plugin is already included in LazyVim, we are just overriding a setting
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- Restore <Tab> and <S-Tab> to their default behavior
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
      })
    end,
  },

  -- ADDED: Explicit mapping for Ctrl + i
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<C-i>", -- Key to press: Ctrl + i
        "<C-i>", -- Action to perform: The default Ctrl + i action
        mode = "n",
        desc = "Jump Forward (Attempted Mapping)",
      },
    },
  },
}
