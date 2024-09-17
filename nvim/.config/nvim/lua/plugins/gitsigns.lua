return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▒" },
      change = { text = "▒" },
      delete = { text = "▒" },
      topdelete = { text = "▒" },
      changedelete = { text = "▒" },
      untracked = { text = "▒" },
    },
    signs_staged = {
      add = { text = "▒" },
      change = { text = "▒" },
      delete = { text = "▒" },
      topdelete = { text = "▒" },
      changedelete = { text = "▒" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]h", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[h", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      -- Actions
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line" })
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
      map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff this" })
      map("n", "<leader>hD", function() gitsigns.diffthis("~") end, { desc = "Diff all" })
      map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle deleted" })

      map(
        "v",
        "<leader>hs",
        function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Stage hunk" }
      )
      map(
        "v",
        "<leader>hr",
        function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Stage hunk" }
      )

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
    end,
  },
}
