return {
  {
    "antosha417/nvim-lsp-file-operations",
    version = "*",
    lazy = "false",
    dependencies = { "nvim-tree/nvim-tree.lua" },
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    config = function()
      local nvim_tree = require("nvim-tree")
      local lsp_file_operations = require("lsp-file-operations")

      nvim_tree.setup({
        sort_by = "case_sensitive",
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })

      lsp_file_operations.setup()
    end,
  },
}
