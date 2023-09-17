return {
  {
    "vim-test/vim-test",
    keys = {
      -- stylua: ignore start
      { '<leader>tf', '<Cmd>TestFile<CR>',               desc = 'Test: file' },
      { '<leader>tF', '<Cmd>TestFile --coverage<CR>',    desc = 'Test: file (coverage)' },
      { '<leader>tl', '<Cmd>TestLast<CR>',               desc = 'Test: last' },
      { '<leader>tL', '<Cmd>TestLast --coverage<CR>',    desc = 'Test: last (coverage)' },
      { '<leader>tn', '<Cmd>TestNearest<CR>',            desc = 'Test: nearest' },
      { '<leader>tN', '<Cmd>TestNearest --coverage<CR>', desc = 'Test: nearest (coverage)' },
      { '<leader>ts', '<Cmd>TestSuite<CR>',              desc = 'Test: suite' },
      { '<leader>tS', '<Cmd>TestSuite --coverage<CR>',   desc = 'Test: suite (coverage)' },
      { '<leader>tv', '<Cmd>TestVisit<CR>',              desc = 'Test: visit' },
      -- stylua: ignore end
    },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#start_normal"] = "1"
      vim.g["test#neovim#term_position"] = "vert"
    end,
  },
  {
    "andythigpen/nvim-coverage",
    keys = {
      { "<leader>tc", "<Cmd>Coverage<CR>", desc = "Test: coverage" },
    },
    config = function()
      require("coverage").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
