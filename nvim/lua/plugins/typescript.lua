return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        expose_as_code_action = {
          "fix_all",
          "remove_unused",
          "add_missing_imports",
        },
      },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    },
  },
  {
    "dmmulroy/tsc.nvim",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    opts = {},
  },
  {
    "prettier/vim-prettier",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "css",
      "less",
      "scss",
      "graphql",
      "markdown",
      "vue",
      "html",
    },
  },
}
