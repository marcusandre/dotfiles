return {
  {
    "vim-test/vim-test",
    cmd = {
      "TestFile",
      "TestLast",
      "TestNearest",
      "TestSuite",
      "TestVisit",
    },
    init = function()
      vim.g["test#custom_strategies"] = {
        wezterm_wrapped = function(cmd)
          vim.fn["test#strategy#wezterm"]("clear; " .. cmd .. "\n")
          vim.g["test#wezterm#pane_id"] = nil
        end,
      }
      vim.g["test#strategy"] = "wezterm_wrapped"
    end,
  },
  {
    "tpope/vim-projectionist",
    event = "VeryLazy",
  },
  {
    "andythigpen/nvim-coverage",
    cmd = "Coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
