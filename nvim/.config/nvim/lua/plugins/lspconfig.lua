return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
  config = function()
    local tools = {
      "gofumpt",
      "goimports",
      "golines",
      "hclfmt",
      "stylua",
      "taplo",
      "zls",
    }

    local servers = {
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
      zls = {
        settings = {
          zls = {
            enable_inlay_hints = true,
            enable_snippets = true,
            warn_style = true,
          },
        },
      },
    }

    vim.g.zig_fmt_parse_errors = 0
    vim.g.zig_fmt_autosave = 0

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, tools)

    local mason = require("mason-tool-installer")
    mason.setup({
      ensure_installed = ensure_installed,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    require("lspconfig").gleam.setup({})

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
