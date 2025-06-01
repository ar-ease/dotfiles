return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
<<<<<<< HEAD

=======
>>>>>>> fcb6804 (added rainbow brackets lazyvim)
      -- Keymaps
      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():append()
      end, { desc = "Harpoon Add File" })
<<<<<<< HEAD
      vim.keymap.set("n", "<leader>hh", function()
=======
      vim.keymap.set("n", "<leader>hm", function()
>>>>>>> fcb6804 (added rainbow brackets lazyvim)
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon Menu" })

      -- Quick navigation
      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon File 1" })
      vim.keymap.set("n", "<leader>h2", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon File 2" })
      vim.keymap.set("n", "<leader>h3", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon File 3" })
      vim.keymap.set("n", "<leader>h4", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon File 4" })
<<<<<<< HEAD
=======

      -- Next/previous file navigation
      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
      end, { desc = "Harpoon Prev File" })
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
      end, { desc = "Harpoon Next File" })

      -- Remove current file from list
      vim.keymap.set("n", "<leader>hr", function()
        harpoon:list():remove()
      end, { desc = "Remove from Harpoon" })

      -- Clear all marks
      vim.keymap.set("n", "<leader>hc", function()
        harpoon:list():clear()
      end, { desc = "Clear Harpoon List" })
>>>>>>> fcb6804 (added rainbow brackets lazyvim)
    end,
  },
}
