return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    { "b0o/SchemaStore.nvim", lazy = true, version = false },
  },
  config = function()
    local tools = {
      "bashls",
      "eslint-lsp",
      "gofumpt",
      "goimports",
      "golines",
      "hclfmt",
      "prettier",
      "shfmt",
      "stylua",
      "taplo",
      "vtsls",
      "yamlfmt",
      "zls",
    }

    local servers = {
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            format = { enable = true },
            validate = { enable = true },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
        ---@diagnostic disable-next-line: unused-local
        on_attach = function(client, bufnr) vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end,
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, tools)

    local mason = require("mason-tool-installer")
    mason.setup({
      ensure_installed = ensure_installed,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    require("lspconfig").bashls.setup({})
    require("lspconfig").gleam.setup({})
    require("lspconfig").zls.setup({})

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
      callback = function(event)
        -- Code Actions
        vim.keymap.set({ "n", "x" }, "<space>a", vim.lsp.buf.code_action, { desc = "Apply code action (LSP)" })

        -- Rename
        vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, { desc = "Rename symbol (LSP)" })
      end,
    })
  end,
}
