return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      fish = { "fish_indent" },
      gleam = { "gleam" },
      go = { "gofumpt", "goimports", "golines" },
      hcl = { "hclfmt" },
      just = { "just", "squeeze_blanks", "indent_expr" },
      lua = { "stylua" },
      markdown = { "markdown-toc", "markdownlint" },
      query = { "format-queries" },
      roc = { "roc" },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
      toml = { "taplo" },
      zig = { "zigfmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
}
