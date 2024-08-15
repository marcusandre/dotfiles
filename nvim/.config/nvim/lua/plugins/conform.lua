return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        ["terraform-vars"] = { "terraform_fmt" },
        fish = { "fish_indent" },
        go = { "goimports", "gofumpt" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { { "prettierd", "prettier" }, "markdownlint", "markdown-toc" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        typescript = { "eslint" },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args) require("conform").format({ bufnr = args.buf }) end,
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
  end,
}
