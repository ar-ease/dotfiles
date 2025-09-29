-- Comprehensive LSP Configuration
return {
  -- Mason tool installer
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- Language Servers
        "lua-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "pyright",
        "rust-analyzer",
        "gopls",
        "prisma-language-server",
        "json-lsp",
        "yaml-language-server",
        "css-lsp",
        "html-lsp",

        -- Formatters & Linters
        "prettier",
        "luacheck",
        "shellcheck",
        "shfmt",
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<leader>jh",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          local status = vim.lsp.inlay_hint.is_enabled() and "enabled" or "disabled"
          local icon = vim.lsp.inlay_hint.is_enabled() and "󰻃 " or "󰻄 "
          LazyVim.info(icon .. "Inlay hints " .. status, { title = "LSP" })
        end,
        desc = "Toggle Inlay Hints",
      },
    },
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- Lua
        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              diagnostics = {
                globals = { "vim" },
                disable = { "incomplete-signature-doc", "trailing-space" },
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },

        -- TypeScript/JavaScript
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
              preferences = {
                includePackageJsonAutoImports = "on",
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },

        -- Web Technologies
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        cssls = {},
        html = {},

        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },

        -- Rust
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },

        -- Go
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },

        -- Database & Config
        prismals = {},
        jsonls = {},
        yamlls = {},
      },
      setup = {},
    },
  },
}
