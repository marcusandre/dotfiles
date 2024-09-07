return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.bufremove").setup()
    require("mini.notify").setup()
  end,
}
