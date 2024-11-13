return {
  {
    "vim-test/vim-test",
    dependencies = { "tpope/vim-projectionist" },
    init = function()
      vim.keymap.set("n", "<leader>t", "<CMD>TestNearest<CR>", { desc = "Test nearest" })
      vim.keymap.set("n", "<leader>T", "<CMD>TestFile<CR>", { desc = "Test file" })

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
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
