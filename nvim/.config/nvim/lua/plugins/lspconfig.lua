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
      "stylua",
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
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, tools)

    local mason = require("mason-tool-installer")
    mason.setup({
      ensure_installed = ensure_installed,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
