return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        gitconfig = { "squeeze_blanks", "indent_expr" },
        just = { "just", "squeeze_blanks", "indent_expr" },
        lua = { "stylua" },
        markdown = { "markdown-toc", "markdownlint" },
        query = { "format-queries" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
