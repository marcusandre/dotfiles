return {
  "tpope/vim-projectionist",
  "tpope/vim-sleuth",
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    lazy = false,
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
    opts = nil,
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
}
