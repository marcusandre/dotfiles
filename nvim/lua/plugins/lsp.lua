return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "lukas-reineke/lsp-format.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      require("mason").setup()
      require("lsp-format").setup({})
      require("fidget").setup({})

      local servers = {
        bashls = {},
        cssls = {},
        eslint = {},
        html = {},
        jsonls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim", }, },
          },
        },
        -- rome = {},
        rust_analyzer = {},
        stylelint_lsp = {},
        terraformls = {},
        tsserver = {},
        yamlls = {},
      }

      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local on_attach = function(client, bufnr)
        if client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end

        require("lsp-format").on_attach(client)

        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })

        -- :EslintFixAll
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
          command = "silent! EslintFixAll",
          group = vim.api.nvim_create_augroup("EslintFmt", {}),
        })
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
      keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "LSP: diagnostics popup" })
      keymap.set("n", "<leader>lf", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "LSP: format" })
      keymap.set("n", "<space>ld", vim.lsp.buf.type_definition, { desc = "LSP: type definition" })
      keymap.set("n", "<space>la", vim.lsp.buf.code_action, { desc = "LSP: code action" })
      keymap.set("n", "<space>lr", vim.lsp.buf.rename, { desc = "LSP: rename" })
      keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: hover" })
      keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: declaration" })
      keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: definition" })
      keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: implementation" })
      keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: references" })
    end,
  },
}
