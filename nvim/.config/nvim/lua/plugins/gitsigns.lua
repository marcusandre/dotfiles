return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, "<leader>" .. l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      -- Actions
      map("n", "hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
      map("n", "hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
      map("n", "hS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
      map("n", "hu", gitsigns.undo_stage_hunk, { desc = "Undo State hunk" })
      map("n", "hR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
      map("n", "hp", gitsigns.preview_hunk, { desc = "Preview" })
      map("n", "hb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line" })
      map("n", "ob", gitsigns.toggle_current_line_blame, { desc = "Blame line (toggle)" })
      map("n", "hd", gitsigns.diffthis, { desc = "Diff" })
      map("n", "hD", function() gitsigns.diffthis("~") end, { desc = "Diff (all)" })
      map("n", "ht", gitsigns.toggle_deleted, { desc = "Toggle deleted" })

      map(
        "v",
        "hs",
        function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Stage hunk" }
      )
      map(
        "v",
        "hr",
        function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Reset hunk" }
      )

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  },
}
