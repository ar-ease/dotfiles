return {
  -- Copilot configuration
  {
    "github/copilot.vim",
    lazy = false, -- Load Copilot on startup
    keys = {
      {
        "<leader>jy",
        function()
          -- Check current Copilot status
          local status = vim.fn.exists("*copilot#Enabled") == 1 and vim.fn["copilot#Enabled"]() == 1

          if status then
            -- Disable Copilot
            vim.cmd("Copilot disable")
            LazyVim.notify("Copilot disabled", { title = "Copilot" })
          else
            -- Enable Copilot
            vim.cmd("Copilot enable")
            LazyVim.notify("Copilot enabled", { title = "Copilot" })
          end
        end,
        desc = "Toggle Copilot",
      },
    },
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

      -- Optional: Add status function for lualine
      _G.copilot_status = function()
        local status = vim.fn.exists("*copilot#Enabled") == 1 and vim.fn["copilot#Enabled"]() == 1
        return status and " " or ""
      end
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      pcall(function()
        require("CopilotChat").setup({
          debug = false,
          show_help = true,
          prompts = {
            Explain = "Explain how this code works.",
            Review = "Review this code and suggest improvements.",
            Tests = "Generate unit tests for this code.",
            Fix = "This code has an issue. Help me fix it.",
          },
        })
      end)
    end,
    keys = {
      {
        "\\1",
        function()
          pcall(function()
            require("CopilotChat").toggle()
          end)
        end,
        desc = "Toggle Copilot Chat",
      },
      {
        "\\2",
        function()
          pcall(function()
            local input = vim.fn.input("Chat: ")
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Copilot Chat Prompt",
      },
      {
        "\\3",
        function()
          pcall(function()
            require("CopilotChat").explain()
          end)
        end,
        desc = "Explain Code",
      },
    },
  },
}
