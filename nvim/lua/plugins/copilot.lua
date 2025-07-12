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
            Fix = "Fix any issues in this code.",
            Optimize = "Optimize this code for better performance.",
            Docs = "Add documentation/comments to this code.",
            Refactor = "Refactor this code to improve readability and maintainability.",
            BugFix = "Find and fix any bugs in this code.",
            Secure = "Make this code more secure.",
            Convert = "Convert this code to a different approach or pattern.",
          },
          -- Configure inline chat
          window = {
            layout = "float",
            width = 0.8,
            height = 0.6,
          },
        })
      end)
    end,
    keys = {
      -- Original keybindings
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

      -- Inline Chat (Cursor-like Cmd+K functionality)
      {
        "<leader>k",
        function()
          pcall(function()
            local input = vim.fn.input("Inline Chat: ")
            if input ~= "" then
              -- Get current selection or current line
              local mode = vim.fn.mode()
              if mode == "v" or mode == "V" then
                -- Visual mode - use selection
                require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
              else
                -- Normal mode - use current buffer
                require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
              end
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Inline Chat (Cursor-like Cmd+K)",
      },

      -- Quick Fix
      {
        "<leader>kf",
        function()
          pcall(function()
            local mode = vim.fn.mode()
            if mode == "v" or mode == "V" then
              require("CopilotChat").ask(
                "Fix any issues in this code",
                { selection = require("CopilotChat.select").visual }
              )
            else
              require("CopilotChat").ask(
                "Fix any issues in this code",
                { selection = require("CopilotChat.select").buffer }
              )
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Quick Fix",
      },

      -- Optimize Code
      {
        "<leader>ko",
        function()
          pcall(function()
            local mode = vim.fn.mode()
            if mode == "v" or mode == "V" then
              require("CopilotChat").ask(
                "Optimize this code for better performance",
                { selection = require("CopilotChat.select").visual }
              )
            else
              require("CopilotChat").ask(
                "Optimize this code for better performance",
                { selection = require("CopilotChat.select").buffer }
              )
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Optimize Code",
      },

      -- Add Comments/Documentation
      {
        "<leader>kd",
        function()
          pcall(function()
            local mode = vim.fn.mode()
            if mode == "v" or mode == "V" then
              require("CopilotChat").ask(
                "Add comprehensive comments and documentation to this code",
                { selection = require("CopilotChat.select").visual }
              )
            else
              require("CopilotChat").ask(
                "Add comprehensive comments and documentation to this code",
                { selection = require("CopilotChat.select").buffer }
              )
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Add Documentation",
      },

      -- Refactor Code
      {
        "<leader>kr",
        function()
          pcall(function()
            local mode = vim.fn.mode()
            if mode == "v" or mode == "V" then
              require("CopilotChat").ask(
                "Refactor this code to improve readability and maintainability",
                { selection = require("CopilotChat.select").visual }
              )
            else
              require("CopilotChat").ask(
                "Refactor this code to improve readability and maintainability",
                { selection = require("CopilotChat.select").buffer }
              )
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Refactor Code",
      },

      -- Generate Tests
      {
        "<leader>kt",
        function()
          pcall(function()
            local mode = vim.fn.mode()
            if mode == "v" or mode == "V" then
              require("CopilotChat").ask(
                "Generate comprehensive unit tests for this code",
                { selection = require("CopilotChat.select").visual }
              )
            else
              require("CopilotChat").ask(
                "Generate comprehensive unit tests for this code",
                { selection = require("CopilotChat.select").buffer }
              )
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Generate Tests",
      },

      -- Explain Code (Enhanced)
      {
        "<leader>ke",
        function()
          pcall(function()
            local mode = vim.fn.mode()
            if mode == "v" or mode == "V" then
              require("CopilotChat").ask(
                "Explain this code in detail, including its purpose, how it works, and any potential issues",
                { selection = require("CopilotChat.select").visual }
              )
            else
              require("CopilotChat").ask(
                "Explain this code in detail, including its purpose, how it works, and any potential issues",
                { selection = require("CopilotChat.select").buffer }
              )
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Explain Code",
      },

      -- Security Review
      {
        "<leader>ks",
        function()
          pcall(function()
            local mode = vim.fn.mode()
            if mode == "v" or mode == "V" then
              require("CopilotChat").ask(
                "Review this code for security vulnerabilities and suggest improvements",
                { selection = require("CopilotChat.select").visual }
              )
            else
              require("CopilotChat").ask(
                "Review this code for security vulnerabilities and suggest improvements",
                { selection = require("CopilotChat.select").buffer }
              )
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Security Review",
      },

      -- Custom Inline Edit with Input
      {
        "<leader>ki",
        function()
          pcall(function()
            local instruction = vim.fn.input("Edit instruction: ")
            if instruction ~= "" then
              local mode = vim.fn.mode()
              local prompt = "Apply this change: " .. instruction
              if mode == "v" or mode == "V" then
                require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").visual })
              else
                require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").buffer })
              end
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Custom Inline Edit",
      },

      -- Convert/Transform Code
      {
        "<leader>kc",
        function()
          pcall(function()
            local conversion = vim.fn.input("Convert to (e.g., 'async/await', 'functional style', 'TypeScript'): ")
            if conversion ~= "" then
              local mode = vim.fn.mode()
              local prompt = "Convert this code to " .. conversion
              if mode == "v" or mode == "V" then
                require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").visual })
              else
                require("CopilotChat").ask(prompt, { selection = require("CopilotChat.select").buffer })
              end
            end
          end)
        end,
        mode = { "n", "v" },
        desc = "Convert Code",
      },
    },
  },
}
