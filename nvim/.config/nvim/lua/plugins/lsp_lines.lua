return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  enabled = false,
  lazy = false,
  keys = {
    {
      "<leader>ol",
      function() require("lsp_lines").toggle() end,
      desc = "Toggle lsp_lines",
    },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
    })

    require("lsp_lines").setup()
  end,
}
