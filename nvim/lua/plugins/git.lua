return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gg", "<Cmd>Git<CR>", { desc = "Open fugitive" })
    end
  },
  "tpope/vim-rhubarb",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        -- signs = {
        --   add = { text = "▒" },
        --   change = { text = "▒" },
        --   changedelete = { text = "▓" },
        --   delete = { text = "▓" },
        --   topdelete = { text = "▓" },
        --   untracked = { text = "░" },
        -- },
        numhl = true,
        linehl = true,
        preview_config = { border = "double" },
        watch_gitdir = { interval = 1000 },
      })

      vim.keymap.set("n", "[h", "<Cmd>Gitsigns prev_hunk<CR>zvzz", { desc = "Goto previous hunk" })
      vim.keymap.set("n", "]h", "<Cmd>Gitsigns next_hunk<CR>zvzz", { desc = "Goto next hunk" })
      vim.keymap.set("n", "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Goto next hunk" })
    end,
  },
}
