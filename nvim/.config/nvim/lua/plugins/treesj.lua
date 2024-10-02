return {
  "Wansmer/treesj",
  -- keys = {
  --   vim.keymap.set("n", "<leader>m", function() require("treesj").toggle() end),
  --   vim.keymap.set("n", "<leader>M", function() require("treesj").toggle({ split = { recursive = true } }) end),
  -- },
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
