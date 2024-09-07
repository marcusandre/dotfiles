return {
  "Wansmer/treesj",
  keys = { "<space>m", "<space>M" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
}
