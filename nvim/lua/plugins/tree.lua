return {
  {
    "antosha417/nvim-lsp-file-operations",
    version = "*",
    lazy = "false",
    dependencies = { "nvim-tree/nvim-tree.lua" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
      require("lsp-file-operations").setup()
    end,
  },
}
