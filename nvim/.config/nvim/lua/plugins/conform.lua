return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      fish = { "fish_indent" },
      gleam = { "gleam" },
      go = { "gofumpt", "goimports", "golines" },
      hcl = { "hclfmt" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      just = { "just", "squeeze_blanks", "indent_expr" },
      lua = { "stylua" },
      query = { "format-queries" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      terraform = { "terraform_fmt" },
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
