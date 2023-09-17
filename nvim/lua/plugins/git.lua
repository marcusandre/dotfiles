return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▒" },
          change = { text = "▒" },
          changedelete = { text = "▓" },
          delete = { text = "▓" },
          topdelete = { text = "▓" },
          untracked = { text = "░" },
        },
        preview_config = { border = "double" },
        watch_gitdir = { interval = 1000 },
      })

      vim.keymap.set("n", "<leader>G", "<Cmd>Git<CR>", { desc = "Open fugitive" })
      vim.keymap.set("n", "[h", "<Cmd>Gitsigns prev_hunk<CR>zvzz", { desc = "Goto previous hunk" })
      vim.keymap.set("n", "]h", "<Cmd>Gitsigns next_hunk<CR>zvzz", { desc = "Goto next hunk" })
    end,
  },
}
