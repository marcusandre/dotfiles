return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.bufremove").setup()

      require("mini.completion").setup({
        lsp_completion = { source_func = "omnifunc" },
      })

      require("mini.cursorword").setup()
      require("mini.notify").setup()
      require("mini.statusline").setup()
    end,
  },
}
