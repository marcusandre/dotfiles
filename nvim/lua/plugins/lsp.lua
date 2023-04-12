return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup({})
        end,
      },
    },
    config = function()
      require("mason").setup()

      local servers = {
        rust_analyzer = {},
        tsserver = {},
        eslint = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              globals = {
                "vim",
              },
            },
          },
        },
      }

      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })

      local keymap = vim.keymap

      -- Keymaps
      keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
      keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "LSP: diagnostics popup" })
      keymap.set("n", "<leader>lf", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "LSP: format" })
      keymap.set("n", "<space>D", vim.lsp.buf.type_definition)
      keymap.set("n", "<space>la", vim.lsp.buf.code_action)
      keymap.set("n", "<space>rn", vim.lsp.buf.rename)
      keymap.set("n", "K", vim.lsp.buf.hover)
      keymap.set("n", "gD", vim.lsp.buf.declaration)
      keymap.set("n", "gd", vim.lsp.buf.definition)
      keymap.set("n", "gi", vim.lsp.buf.implementation)
      keymap.set("n", "gr", vim.lsp.buf.references)

      -- :EslintFixAll
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
        command = "silent! EslintFixAll",
        group = vim.api.nvim_create_augroup("EslintFmt", {}),
      })
    end,
  },
}
