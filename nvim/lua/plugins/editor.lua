return {
  "tpope/vim-projectionist",
  "tpope/vim-sleuth",
  {
    "mbbill/undotree",
    keys = {
      { "<leader>eu", "<CMD>UndotreeToggle<CR>", desc = "Open undotree" },
    },
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      { "<leader>os", '<cmd>lua require("spectre").toggle()<CR>', desc = "Spectre: Toggle" },
    },
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "antosha417/nvim-lsp-file-operations",
    version = "*",
    lazy = "false",
    dependencies = { "nvim-tree/nvim-tree.lua" },
    keys = {
      -- stylua: ignore start
      { '<leader>ee', '<Cmd>NvimTreeToggle<cr>',         desc = 'Explore: Tree' },
      { '<leader>ef', '<Cmd>NvimTreeFindFileToggle<cr>', desc = 'Explore: Tree (File)' },
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
