return {
  { 'echasnovski/mini.ai',         version = false, config = function() require('mini.ai').setup(); end },
  { 'echasnovski/mini.align',      version = false, config = function() require('mini.align').setup(); end },
  { 'echasnovski/mini.bracketed',  version = false, config = function() require('mini.bracketed').setup(); end },
  { 'echasnovski/mini.bufremove',  version = false, config = function() require('mini.bufremove').setup(); end },
  { 'echasnovski/mini.comment',    version = false, config = function() require('mini.comment').setup(); end },
  { 'echasnovski/mini.completion', version = false, config = function() require('mini.completion').setup(); end },
  { 'echasnovski/mini.pairs',      version = false, config = function() require('mini.pairs').setup(); end },
  { 'echasnovski/mini.sessions',   version = false, config = function() require('mini.sessions').setup(); end },
  { 'echasnovski/mini.surround',   version = false, config = function() require('mini.surround').setup(); end },
  {
    "vim-test/vim-test",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "andythigpen/nvim-coverage",
    },
    config = function()
      local coverage = require('coverage')
      local keymap = vim.keymap

      coverage.setup({
        commands = true,
        highlights = {
          covered = { fg = "#C3E88D" },
          uncovered = { fg = "#F07178" },
        },
        signs = {
          covered = { priority = 100, hl = "CoverageCovered", text = "▎" },
          uncovered = { priority = 100, hl = "CoverageUncovered", text = "▎" },
        },
        summary = { min_coverage = 80.0, },
        lang = {},
      })

      vim.cmd([[
        let test#javascript#jest#options = '--coverage'
      ]])

      keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = '[T]est [F]ile' });
      keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = '[T]est [F]ile' });
      keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = '[T]est [F]ile' });
      keymap.set('n', '<leader>tv', ':TestVisit<CR>', { desc = '[T]est [F]ile' });
      keymap.set("n", "<leader>tc", "<cmd>vsplit | terminal npx jest --coverage --silent -- %<CR>",
        { desc = '[T]est [F]ile' })
    end,
  },
}
