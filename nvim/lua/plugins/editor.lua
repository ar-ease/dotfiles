return {
  -- Configure LazyVim to load the catppuccin colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- Fix telescope configuration
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      -- Regular search (filtered, clean)
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = true, -- Respects .gitignore
            hidden = true, -- Shows config files like .eslintrc
            file_ignore_patterns = {
              "node_modules/",
              ".git/",
              ".DS_Store",
              "dist/",
              "build/",
              "coverage/",
              ".next/",
              ".cache/",
              "*.log",
            },
          })
        end,
        desc = "Find files (filtered)",
      },
      -- Deep search (everything, for debugging)
      {
        ";F",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = true, -- Shows .gitignore files
            hidden = true,
            file_ignore_patterns = { ".git/" }, -- Only ignore git internals
          })
        end,
        desc = "Find ALL files (debugging)",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Live grep",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Buffers",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume telescope",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "treesitter symbols",
      },
      -- File browser with current buffer directory
      {
        "sf",
        function()
          local telescope = require("telescope")
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end
          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0, -- Changed from 1 to 0 for better transparency
        mappings = {
          n = {},
        },
      })

      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }

      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
            },
          },
        },
      }

      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
  -- Ensure catppuccin is installed
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1001,
    opts = {
      flavour = "mocha",
      transparent_background = true, -- Changed to true to match your colorscheme
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
      },
    },
  },
}
