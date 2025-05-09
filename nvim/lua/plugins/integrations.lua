return {
  -- HTTP Tools
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        result_split_in_place = false,
        stay_in_current_window_after_split = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          show_statistics = false,
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end,
  },
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    dependencies = { "rest-nvim/rest.nvim" },
    opts = {},
    keys = {
      { "\\x", "<Nop>", desc = "+Rest" },
      { "\\r", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
      { "\\t", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
      { "\\N", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
      { "\\n", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
    },
  },

  -- Mason setup
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- LSP setup - COMPLETELY BYPASSING mason-lspconfig's automatic_enable feature
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      -- Set up lspconfig directly without using mason-lspconfig's automatic setup
      local lspconfig = require("lspconfig")

      -- Basic Lua LSP setup
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })

      -- Add any other LSP servers you need
      -- lspconfig.tsserver.setup({})
      -- lspconfig.pyright.setup({})
    end,
  },

  -- Setup mason-lspconfig with MINIMAL configuration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      -- ONLY use mason-lspconfig to install servers, not to configure them
      pcall(function()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "lua_ls",
            -- Add other servers you want to install
          },
          -- Explicitly disable the automatic server setup
          automatic_installation = false,
        })
      end)
    end,
  },
}
