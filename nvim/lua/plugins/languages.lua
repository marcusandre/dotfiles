return {
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform.formatters.stylua').require_cwd = true
      require('conform.formatters.eslint_d').require_cwd = true

      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { { 'eslint_d' } },
          javascriptreact = { { 'eslint_d' } },
          typescript = { { 'eslint_d' } },
          typescriptreact = { { 'eslint_d' } },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters = {
          stylua = {
            require_cwd = true,
          },
          eslint_d = {
            require_cwd = true,
          },
        },
      })

      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      settings = {
        expose_as_code_action = {
          'fix_all',
          'remove_unused',
          'add_missing_imports',
        },
      },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    },
  },
}
