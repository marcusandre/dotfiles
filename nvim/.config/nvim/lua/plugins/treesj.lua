return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "<leader>m",
      function() require("treesj").toggle({ split = { recursive = true } }) end,
      desc = "Split/join recursive",
    },
  },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
}
