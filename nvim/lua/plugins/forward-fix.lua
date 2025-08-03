return {
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
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<C-i>",
        function()
          -- Execute the forward jump
          local count = vim.v.count1
          for _ = 1, count do
            vim.cmd("normal! \x01\x09") -- This is the actual <C-i> command
          end
        end,
        mode = "n",
        desc = "Jump Forward",
      },
    },
  },
}
