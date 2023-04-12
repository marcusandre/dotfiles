return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>et", "<CMD>NvimTreeToggle<CR>", desc = "Explore: Tree" },
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
    end,
  },
}
