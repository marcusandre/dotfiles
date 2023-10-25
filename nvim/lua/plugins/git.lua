return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gg", "<Cmd>Git<CR>", { desc = "Open fugitive" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
        preview_config = {
          border = "none",
        },
        numhl = false,
        linehl = false,
        watch_gitdir = { interval = 1000 },
      })

      vim.keymap.set("n", "[h", "<Cmd>Gitsigns prev_hunk<CR>zvzz", { desc = "Goto previous hunk" })
      vim.keymap.set("n", "]h", "<Cmd>Gitsigns next_hunk<CR>zvzz", { desc = "Goto next hunk" })
      vim.keymap.set("n", "<leader>gA", '<Cmd>lua require("gitsigns").stage_buffer()<CR>', { desc = "Add buffer" })
      vim.keymap.set("n", "<leader>ga", '<Cmd>lua require("gitsigns").stage_hunk()<CR>', { desc = "Add (stage) hunk" })
      vim.keymap.set("n", "<leader>gb", '<Cmd>lua require("gitsigns").blame_line()<CR>', { desc = "Blame line" })
      vim.keymap.set("n", "<leader>gp", '<Cmd>lua require("gitsigns").preview_hunk()<CR>', { desc = "Preview hunk" })
      vim.keymap.set(
        "n",
        "<leader>gq",
        '<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>',
        { desc = "Quickfix hunks" }
      )
      vim.keymap.set(
        "n",
        "<leader>gu",
        '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>',
        { desc = "Undo stage hunk" }
      )
      vim.keymap.set(
        "n",
        "<leader>gx",
        '<Cmd>lua require("gitsigns").reset_hunk()<CR>',
        { desc = "Discard (reset) hunk" }
      )
      vim.keymap.set(
        "n",
        "<leader>gX",
        '<Cmd>lua require("gitsigns").reset_buffer()<CR>',
        { desc = "Discard (reset) buffer" }
      )
    end,
  },
}
