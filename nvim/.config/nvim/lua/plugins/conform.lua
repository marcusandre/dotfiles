return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      fish = { "fish_indent" },
      gleam = { "gleam" },
      go = { "gofumpt", "goimports", "golines" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      just = { "just", "squeeze_blanks" },
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      query = { "format-queries" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      toml = { "taplo" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "yamlfmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
}
