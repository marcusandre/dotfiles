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

keymap.set('n', '<leader>tf', ':TestFile<CR>');
keymap.set('n', '<leader>tn', ':TestNearest<CR>');
keymap.set('n', '<leader>tl', ':TestLast<CR>');
keymap.set('n', '<leader>tv', ':TestVisit<CR>');
keymap.set("n", "<leader>tc", "<cmd>vsplit | terminal npx jest --coverage -- %<CR>")
