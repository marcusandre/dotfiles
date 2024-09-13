return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.bufremove").setup()
      require("mini.diff").setup()
      require("mini.extra").setup()
      require("mini.tabline").setup()

      require("mini.pick").setup()
      vim.ui.select = MiniPick.ui_select
    end,
  },
  {
    "echasnovski/mini.icons",
    enabled = vim.g.have_nerd_font,
  },
}
