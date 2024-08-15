return {
  "yioneko/nvim-vtsls",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "typescript", "typescriptreact", "tsx" },
      callback = function()
        local map = vim.keymap.set

        map(
          "n",
          "<leader>co",
          function() require("vtsls").commands.organize_imports(0) end,
          { desc = "Organize imports" }
        )
        map(
          "n",
          "<leader>cm",
          function() require("vtsls").commands.add_missing_imports(0) end,
          { desc = "Add missing symbols" }
        )
        map(
          "n",
          "<leader>cu",
          function() require("vtsls").commands.remove_unused_imports(0) end,
          { desc = "Remove unused imports" }
        )
        map("n", "<leader>cd", function() require("vtsls").commands.fix_all(0) end, { desc = "Fix all diagnostics" })
        map(
          "n",
          "<leader>cv",
          function() require("vtsls").commands.select_ts_version(0) end,
          { desc = "Select TS workspace version" }
        )
      end,
    })
  end,
}
