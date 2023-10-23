return {
  {
    "antosha417/nvim-lsp-file-operations",
    version = "*",
    lazy = "false",
    dependencies = { "nvim-tree/nvim-tree.lua" },
    keys = {
      -- stylua: ignore start
      { "<leader>ee", "<Cmd>NvimTreeToggle<cr>",         desc = "Explore: Tree" },
      { "<leader>ef", "<Cmd>NvimTreeFindFileToggle<cr>", desc = "Explore: Tree (File)" },
      -- stylua: ignore end
    },
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
